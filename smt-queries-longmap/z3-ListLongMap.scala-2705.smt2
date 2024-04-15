; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40034 () Bool)

(assert start!40034)

(declare-fun b_free!10315 () Bool)

(declare-fun b_next!10315 () Bool)

(assert (=> start!40034 (= b_free!10315 (not b_next!10315))))

(declare-fun tp!36474 () Bool)

(declare-fun b_and!18257 () Bool)

(assert (=> start!40034 (= tp!36474 b_and!18257)))

(declare-fun b!436645 () Bool)

(declare-fun res!257510 () Bool)

(declare-fun e!257779 () Bool)

(assert (=> b!436645 (=> (not res!257510) (not e!257779))))

(declare-datatypes ((array!26755 0))(
  ( (array!26756 (arr!12827 (Array (_ BitVec 32) (_ BitVec 64))) (size!13180 (_ BitVec 32))) )
))
(declare-fun lt!201248 () array!26755)

(declare-datatypes ((List!7658 0))(
  ( (Nil!7655) (Cons!7654 (h!8510 (_ BitVec 64)) (t!13405 List!7658)) )
))
(declare-fun arrayNoDuplicates!0 (array!26755 (_ BitVec 32) List!7658) Bool)

(assert (=> b!436645 (= res!257510 (arrayNoDuplicates!0 lt!201248 #b00000000000000000000000000000000 Nil!7655))))

(declare-fun b!436646 () Bool)

(declare-fun e!257776 () Bool)

(assert (=> b!436646 (= e!257776 e!257779)))

(declare-fun res!257511 () Bool)

(assert (=> b!436646 (=> (not res!257511) (not e!257779))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26755 (_ BitVec 32)) Bool)

(assert (=> b!436646 (= res!257511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201248 mask!1025))))

(declare-fun _keys!709 () array!26755)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436646 (= lt!201248 (array!26756 (store (arr!12827 _keys!709) i!563 k0!794) (size!13180 _keys!709)))))

(declare-fun b!436647 () Bool)

(declare-fun e!257777 () Bool)

(declare-fun e!257780 () Bool)

(declare-fun mapRes!18822 () Bool)

(assert (=> b!436647 (= e!257777 (and e!257780 mapRes!18822))))

(declare-fun condMapEmpty!18822 () Bool)

(declare-datatypes ((V!16395 0))(
  ( (V!16396 (val!5778 Int)) )
))
(declare-datatypes ((ValueCell!5390 0))(
  ( (ValueCellFull!5390 (v!8019 V!16395)) (EmptyCell!5390) )
))
(declare-datatypes ((array!26757 0))(
  ( (array!26758 (arr!12828 (Array (_ BitVec 32) ValueCell!5390)) (size!13181 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26757)

(declare-fun mapDefault!18822 () ValueCell!5390)

(assert (=> b!436647 (= condMapEmpty!18822 (= (arr!12828 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5390)) mapDefault!18822)))))

(declare-fun b!436648 () Bool)

(declare-fun tp_is_empty!11467 () Bool)

(assert (=> b!436648 (= e!257780 tp_is_empty!11467)))

(declare-fun mapNonEmpty!18822 () Bool)

(declare-fun tp!36473 () Bool)

(declare-fun e!257781 () Bool)

(assert (=> mapNonEmpty!18822 (= mapRes!18822 (and tp!36473 e!257781))))

(declare-fun mapValue!18822 () ValueCell!5390)

(declare-fun mapKey!18822 () (_ BitVec 32))

(declare-fun mapRest!18822 () (Array (_ BitVec 32) ValueCell!5390))

(assert (=> mapNonEmpty!18822 (= (arr!12828 _values!549) (store mapRest!18822 mapKey!18822 mapValue!18822))))

(declare-fun b!436649 () Bool)

(declare-fun res!257507 () Bool)

(assert (=> b!436649 (=> (not res!257507) (not e!257776))))

(assert (=> b!436649 (= res!257507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436650 () Bool)

(declare-fun res!257513 () Bool)

(assert (=> b!436650 (=> (not res!257513) (not e!257776))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!436650 (= res!257513 (and (= (size!13181 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13180 _keys!709) (size!13181 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436652 () Bool)

(declare-fun res!257506 () Bool)

(assert (=> b!436652 (=> (not res!257506) (not e!257776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436652 (= res!257506 (validKeyInArray!0 k0!794))))

(declare-fun b!436653 () Bool)

(declare-fun res!257517 () Bool)

(assert (=> b!436653 (=> (not res!257517) (not e!257776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436653 (= res!257517 (validMask!0 mask!1025))))

(declare-fun b!436654 () Bool)

(declare-fun res!257516 () Bool)

(assert (=> b!436654 (=> (not res!257516) (not e!257776))))

(assert (=> b!436654 (= res!257516 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7655))))

(declare-fun b!436655 () Bool)

(assert (=> b!436655 (= e!257781 tp_is_empty!11467)))

(declare-fun b!436656 () Bool)

(declare-fun res!257514 () Bool)

(assert (=> b!436656 (=> (not res!257514) (not e!257776))))

(assert (=> b!436656 (= res!257514 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13180 _keys!709))))))

(declare-fun b!436657 () Bool)

(declare-fun e!257775 () Bool)

(assert (=> b!436657 (= e!257779 e!257775)))

(declare-fun res!257515 () Bool)

(assert (=> b!436657 (=> (not res!257515) (not e!257775))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!436657 (= res!257515 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16395)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16395)

(declare-fun lt!201249 () array!26757)

(declare-datatypes ((tuple2!7672 0))(
  ( (tuple2!7673 (_1!3847 (_ BitVec 64)) (_2!3847 V!16395)) )
))
(declare-datatypes ((List!7659 0))(
  ( (Nil!7656) (Cons!7655 (h!8511 tuple2!7672) (t!13406 List!7659)) )
))
(declare-datatypes ((ListLongMap!6575 0))(
  ( (ListLongMap!6576 (toList!3303 List!7659)) )
))
(declare-fun lt!201251 () ListLongMap!6575)

(declare-fun getCurrentListMapNoExtraKeys!1502 (array!26755 array!26757 (_ BitVec 32) (_ BitVec 32) V!16395 V!16395 (_ BitVec 32) Int) ListLongMap!6575)

(assert (=> b!436657 (= lt!201251 (getCurrentListMapNoExtraKeys!1502 lt!201248 lt!201249 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16395)

(assert (=> b!436657 (= lt!201249 (array!26758 (store (arr!12828 _values!549) i!563 (ValueCellFull!5390 v!412)) (size!13181 _values!549)))))

(declare-fun lt!201247 () ListLongMap!6575)

(assert (=> b!436657 (= lt!201247 (getCurrentListMapNoExtraKeys!1502 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18822 () Bool)

(assert (=> mapIsEmpty!18822 mapRes!18822))

(declare-fun b!436658 () Bool)

(declare-fun res!257512 () Bool)

(assert (=> b!436658 (=> (not res!257512) (not e!257776))))

(declare-fun arrayContainsKey!0 (array!26755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436658 (= res!257512 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436659 () Bool)

(declare-fun res!257508 () Bool)

(assert (=> b!436659 (=> (not res!257508) (not e!257779))))

(assert (=> b!436659 (= res!257508 (bvsle from!863 i!563))))

(declare-fun b!436660 () Bool)

(assert (=> b!436660 (= e!257775 (not true))))

(declare-fun +!1477 (ListLongMap!6575 tuple2!7672) ListLongMap!6575)

(assert (=> b!436660 (= (getCurrentListMapNoExtraKeys!1502 lt!201248 lt!201249 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1477 (getCurrentListMapNoExtraKeys!1502 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7673 k0!794 v!412)))))

(declare-datatypes ((Unit!12971 0))(
  ( (Unit!12972) )
))
(declare-fun lt!201250 () Unit!12971)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!615 (array!26755 array!26757 (_ BitVec 32) (_ BitVec 32) V!16395 V!16395 (_ BitVec 32) (_ BitVec 64) V!16395 (_ BitVec 32) Int) Unit!12971)

(assert (=> b!436660 (= lt!201250 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!615 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436651 () Bool)

(declare-fun res!257505 () Bool)

(assert (=> b!436651 (=> (not res!257505) (not e!257776))))

(assert (=> b!436651 (= res!257505 (or (= (select (arr!12827 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12827 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!257509 () Bool)

(assert (=> start!40034 (=> (not res!257509) (not e!257776))))

(assert (=> start!40034 (= res!257509 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13180 _keys!709))))))

(assert (=> start!40034 e!257776))

(assert (=> start!40034 tp_is_empty!11467))

(assert (=> start!40034 tp!36474))

(assert (=> start!40034 true))

(declare-fun array_inv!9370 (array!26757) Bool)

(assert (=> start!40034 (and (array_inv!9370 _values!549) e!257777)))

(declare-fun array_inv!9371 (array!26755) Bool)

(assert (=> start!40034 (array_inv!9371 _keys!709)))

(assert (= (and start!40034 res!257509) b!436653))

(assert (= (and b!436653 res!257517) b!436650))

(assert (= (and b!436650 res!257513) b!436649))

(assert (= (and b!436649 res!257507) b!436654))

(assert (= (and b!436654 res!257516) b!436656))

(assert (= (and b!436656 res!257514) b!436652))

(assert (= (and b!436652 res!257506) b!436651))

(assert (= (and b!436651 res!257505) b!436658))

(assert (= (and b!436658 res!257512) b!436646))

(assert (= (and b!436646 res!257511) b!436645))

(assert (= (and b!436645 res!257510) b!436659))

(assert (= (and b!436659 res!257508) b!436657))

(assert (= (and b!436657 res!257515) b!436660))

(assert (= (and b!436647 condMapEmpty!18822) mapIsEmpty!18822))

(assert (= (and b!436647 (not condMapEmpty!18822)) mapNonEmpty!18822))

(get-info :version)

(assert (= (and mapNonEmpty!18822 ((_ is ValueCellFull!5390) mapValue!18822)) b!436655))

(assert (= (and b!436647 ((_ is ValueCellFull!5390) mapDefault!18822)) b!436648))

(assert (= start!40034 b!436647))

(declare-fun m!423963 () Bool)

(assert (=> b!436658 m!423963))

(declare-fun m!423965 () Bool)

(assert (=> b!436657 m!423965))

(declare-fun m!423967 () Bool)

(assert (=> b!436657 m!423967))

(declare-fun m!423969 () Bool)

(assert (=> b!436657 m!423969))

(declare-fun m!423971 () Bool)

(assert (=> b!436653 m!423971))

(declare-fun m!423973 () Bool)

(assert (=> start!40034 m!423973))

(declare-fun m!423975 () Bool)

(assert (=> start!40034 m!423975))

(declare-fun m!423977 () Bool)

(assert (=> b!436654 m!423977))

(declare-fun m!423979 () Bool)

(assert (=> b!436660 m!423979))

(declare-fun m!423981 () Bool)

(assert (=> b!436660 m!423981))

(assert (=> b!436660 m!423981))

(declare-fun m!423983 () Bool)

(assert (=> b!436660 m!423983))

(declare-fun m!423985 () Bool)

(assert (=> b!436660 m!423985))

(declare-fun m!423987 () Bool)

(assert (=> b!436651 m!423987))

(declare-fun m!423989 () Bool)

(assert (=> b!436649 m!423989))

(declare-fun m!423991 () Bool)

(assert (=> b!436652 m!423991))

(declare-fun m!423993 () Bool)

(assert (=> mapNonEmpty!18822 m!423993))

(declare-fun m!423995 () Bool)

(assert (=> b!436645 m!423995))

(declare-fun m!423997 () Bool)

(assert (=> b!436646 m!423997))

(declare-fun m!423999 () Bool)

(assert (=> b!436646 m!423999))

(check-sat (not b!436658) (not b!436646) (not b!436653) b_and!18257 (not b!436649) (not b!436645) (not b!436657) (not b!436654) (not b_next!10315) (not mapNonEmpty!18822) (not b!436660) (not b!436652) tp_is_empty!11467 (not start!40034))
(check-sat b_and!18257 (not b_next!10315))
