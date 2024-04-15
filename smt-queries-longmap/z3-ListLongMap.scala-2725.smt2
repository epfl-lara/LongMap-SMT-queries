; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40154 () Bool)

(assert start!40154)

(declare-fun b_free!10435 () Bool)

(declare-fun b_next!10435 () Bool)

(assert (=> start!40154 (= b_free!10435 (not b_next!10435))))

(declare-fun tp!36834 () Bool)

(declare-fun b_and!18377 () Bool)

(assert (=> start!40154 (= tp!36834 b_and!18377)))

(declare-fun b!439525 () Bool)

(declare-fun res!259850 () Bool)

(declare-fun e!259040 () Bool)

(assert (=> b!439525 (=> (not res!259850) (not e!259040))))

(declare-datatypes ((array!26991 0))(
  ( (array!26992 (arr!12945 (Array (_ BitVec 32) (_ BitVec 64))) (size!13298 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26991)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439525 (= res!259850 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439526 () Bool)

(declare-fun res!259846 () Bool)

(assert (=> b!439526 (=> (not res!259846) (not e!259040))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439526 (= res!259846 (validMask!0 mask!1025))))

(declare-fun b!439527 () Bool)

(declare-fun e!259038 () Bool)

(assert (=> b!439527 (= e!259038 (not true))))

(declare-datatypes ((V!16555 0))(
  ( (V!16556 (val!5838 Int)) )
))
(declare-fun minValue!515 () V!16555)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5450 0))(
  ( (ValueCellFull!5450 (v!8079 V!16555)) (EmptyCell!5450) )
))
(declare-datatypes ((array!26993 0))(
  ( (array!26994 (arr!12946 (Array (_ BitVec 32) ValueCell!5450)) (size!13299 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26993)

(declare-fun zeroValue!515 () V!16555)

(declare-fun lt!202150 () array!26993)

(declare-fun lt!202149 () array!26991)

(declare-fun v!412 () V!16555)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7768 0))(
  ( (tuple2!7769 (_1!3895 (_ BitVec 64)) (_2!3895 V!16555)) )
))
(declare-datatypes ((List!7757 0))(
  ( (Nil!7754) (Cons!7753 (h!8609 tuple2!7768) (t!13504 List!7757)) )
))
(declare-datatypes ((ListLongMap!6671 0))(
  ( (ListLongMap!6672 (toList!3351 List!7757)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1550 (array!26991 array!26993 (_ BitVec 32) (_ BitVec 32) V!16555 V!16555 (_ BitVec 32) Int) ListLongMap!6671)

(declare-fun +!1514 (ListLongMap!6671 tuple2!7768) ListLongMap!6671)

(assert (=> b!439527 (= (getCurrentListMapNoExtraKeys!1550 lt!202149 lt!202150 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1514 (getCurrentListMapNoExtraKeys!1550 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7769 k0!794 v!412)))))

(declare-datatypes ((Unit!13045 0))(
  ( (Unit!13046) )
))
(declare-fun lt!202148 () Unit!13045)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!652 (array!26991 array!26993 (_ BitVec 32) (_ BitVec 32) V!16555 V!16555 (_ BitVec 32) (_ BitVec 64) V!16555 (_ BitVec 32) Int) Unit!13045)

(assert (=> b!439527 (= lt!202148 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!652 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!259845 () Bool)

(assert (=> start!40154 (=> (not res!259845) (not e!259040))))

(assert (=> start!40154 (= res!259845 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13298 _keys!709))))))

(assert (=> start!40154 e!259040))

(declare-fun tp_is_empty!11587 () Bool)

(assert (=> start!40154 tp_is_empty!11587))

(assert (=> start!40154 tp!36834))

(assert (=> start!40154 true))

(declare-fun e!259039 () Bool)

(declare-fun array_inv!9444 (array!26993) Bool)

(assert (=> start!40154 (and (array_inv!9444 _values!549) e!259039)))

(declare-fun array_inv!9445 (array!26991) Bool)

(assert (=> start!40154 (array_inv!9445 _keys!709)))

(declare-fun b!439528 () Bool)

(declare-fun e!259036 () Bool)

(assert (=> b!439528 (= e!259036 e!259038)))

(declare-fun res!259852 () Bool)

(assert (=> b!439528 (=> (not res!259852) (not e!259038))))

(assert (=> b!439528 (= res!259852 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202151 () ListLongMap!6671)

(assert (=> b!439528 (= lt!202151 (getCurrentListMapNoExtraKeys!1550 lt!202149 lt!202150 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439528 (= lt!202150 (array!26994 (store (arr!12946 _values!549) i!563 (ValueCellFull!5450 v!412)) (size!13299 _values!549)))))

(declare-fun lt!202147 () ListLongMap!6671)

(assert (=> b!439528 (= lt!202147 (getCurrentListMapNoExtraKeys!1550 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439529 () Bool)

(declare-fun e!259041 () Bool)

(declare-fun mapRes!19002 () Bool)

(assert (=> b!439529 (= e!259039 (and e!259041 mapRes!19002))))

(declare-fun condMapEmpty!19002 () Bool)

(declare-fun mapDefault!19002 () ValueCell!5450)

(assert (=> b!439529 (= condMapEmpty!19002 (= (arr!12946 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5450)) mapDefault!19002)))))

(declare-fun b!439530 () Bool)

(declare-fun res!259848 () Bool)

(assert (=> b!439530 (=> (not res!259848) (not e!259040))))

(assert (=> b!439530 (= res!259848 (or (= (select (arr!12945 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12945 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439531 () Bool)

(assert (=> b!439531 (= e!259041 tp_is_empty!11587)))

(declare-fun b!439532 () Bool)

(declare-fun e!259035 () Bool)

(assert (=> b!439532 (= e!259035 tp_is_empty!11587)))

(declare-fun mapNonEmpty!19002 () Bool)

(declare-fun tp!36833 () Bool)

(assert (=> mapNonEmpty!19002 (= mapRes!19002 (and tp!36833 e!259035))))

(declare-fun mapKey!19002 () (_ BitVec 32))

(declare-fun mapValue!19002 () ValueCell!5450)

(declare-fun mapRest!19002 () (Array (_ BitVec 32) ValueCell!5450))

(assert (=> mapNonEmpty!19002 (= (arr!12946 _values!549) (store mapRest!19002 mapKey!19002 mapValue!19002))))

(declare-fun b!439533 () Bool)

(declare-fun res!259853 () Bool)

(assert (=> b!439533 (=> (not res!259853) (not e!259036))))

(declare-datatypes ((List!7758 0))(
  ( (Nil!7755) (Cons!7754 (h!8610 (_ BitVec 64)) (t!13505 List!7758)) )
))
(declare-fun arrayNoDuplicates!0 (array!26991 (_ BitVec 32) List!7758) Bool)

(assert (=> b!439533 (= res!259853 (arrayNoDuplicates!0 lt!202149 #b00000000000000000000000000000000 Nil!7755))))

(declare-fun b!439534 () Bool)

(assert (=> b!439534 (= e!259040 e!259036)))

(declare-fun res!259851 () Bool)

(assert (=> b!439534 (=> (not res!259851) (not e!259036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26991 (_ BitVec 32)) Bool)

(assert (=> b!439534 (= res!259851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202149 mask!1025))))

(assert (=> b!439534 (= lt!202149 (array!26992 (store (arr!12945 _keys!709) i!563 k0!794) (size!13298 _keys!709)))))

(declare-fun b!439535 () Bool)

(declare-fun res!259847 () Bool)

(assert (=> b!439535 (=> (not res!259847) (not e!259040))))

(assert (=> b!439535 (= res!259847 (and (= (size!13299 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13298 _keys!709) (size!13299 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439536 () Bool)

(declare-fun res!259857 () Bool)

(assert (=> b!439536 (=> (not res!259857) (not e!259040))))

(assert (=> b!439536 (= res!259857 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7755))))

(declare-fun b!439537 () Bool)

(declare-fun res!259849 () Bool)

(assert (=> b!439537 (=> (not res!259849) (not e!259036))))

(assert (=> b!439537 (= res!259849 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19002 () Bool)

(assert (=> mapIsEmpty!19002 mapRes!19002))

(declare-fun b!439538 () Bool)

(declare-fun res!259856 () Bool)

(assert (=> b!439538 (=> (not res!259856) (not e!259040))))

(assert (=> b!439538 (= res!259856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439539 () Bool)

(declare-fun res!259855 () Bool)

(assert (=> b!439539 (=> (not res!259855) (not e!259040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439539 (= res!259855 (validKeyInArray!0 k0!794))))

(declare-fun b!439540 () Bool)

(declare-fun res!259854 () Bool)

(assert (=> b!439540 (=> (not res!259854) (not e!259040))))

(assert (=> b!439540 (= res!259854 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13298 _keys!709))))))

(assert (= (and start!40154 res!259845) b!439526))

(assert (= (and b!439526 res!259846) b!439535))

(assert (= (and b!439535 res!259847) b!439538))

(assert (= (and b!439538 res!259856) b!439536))

(assert (= (and b!439536 res!259857) b!439540))

(assert (= (and b!439540 res!259854) b!439539))

(assert (= (and b!439539 res!259855) b!439530))

(assert (= (and b!439530 res!259848) b!439525))

(assert (= (and b!439525 res!259850) b!439534))

(assert (= (and b!439534 res!259851) b!439533))

(assert (= (and b!439533 res!259853) b!439537))

(assert (= (and b!439537 res!259849) b!439528))

(assert (= (and b!439528 res!259852) b!439527))

(assert (= (and b!439529 condMapEmpty!19002) mapIsEmpty!19002))

(assert (= (and b!439529 (not condMapEmpty!19002)) mapNonEmpty!19002))

(get-info :version)

(assert (= (and mapNonEmpty!19002 ((_ is ValueCellFull!5450) mapValue!19002)) b!439532))

(assert (= (and b!439529 ((_ is ValueCellFull!5450) mapDefault!19002)) b!439531))

(assert (= start!40154 b!439529))

(declare-fun m!426243 () Bool)

(assert (=> b!439530 m!426243))

(declare-fun m!426245 () Bool)

(assert (=> b!439534 m!426245))

(declare-fun m!426247 () Bool)

(assert (=> b!439534 m!426247))

(declare-fun m!426249 () Bool)

(assert (=> b!439533 m!426249))

(declare-fun m!426251 () Bool)

(assert (=> b!439525 m!426251))

(declare-fun m!426253 () Bool)

(assert (=> b!439538 m!426253))

(declare-fun m!426255 () Bool)

(assert (=> b!439528 m!426255))

(declare-fun m!426257 () Bool)

(assert (=> b!439528 m!426257))

(declare-fun m!426259 () Bool)

(assert (=> b!439528 m!426259))

(declare-fun m!426261 () Bool)

(assert (=> b!439527 m!426261))

(declare-fun m!426263 () Bool)

(assert (=> b!439527 m!426263))

(assert (=> b!439527 m!426263))

(declare-fun m!426265 () Bool)

(assert (=> b!439527 m!426265))

(declare-fun m!426267 () Bool)

(assert (=> b!439527 m!426267))

(declare-fun m!426269 () Bool)

(assert (=> b!439526 m!426269))

(declare-fun m!426271 () Bool)

(assert (=> b!439539 m!426271))

(declare-fun m!426273 () Bool)

(assert (=> mapNonEmpty!19002 m!426273))

(declare-fun m!426275 () Bool)

(assert (=> start!40154 m!426275))

(declare-fun m!426277 () Bool)

(assert (=> start!40154 m!426277))

(declare-fun m!426279 () Bool)

(assert (=> b!439536 m!426279))

(check-sat (not b!439533) (not b_next!10435) (not mapNonEmpty!19002) (not b!439536) b_and!18377 (not b!439528) (not b!439539) (not b!439525) tp_is_empty!11587 (not b!439526) (not b!439534) (not start!40154) (not b!439527) (not b!439538))
(check-sat b_and!18377 (not b_next!10435))
