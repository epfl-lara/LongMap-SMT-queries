; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39596 () Bool)

(assert start!39596)

(declare-fun b_free!9877 () Bool)

(declare-fun b_next!9877 () Bool)

(assert (=> start!39596 (= b_free!9877 (not b_next!9877))))

(declare-fun tp!35160 () Bool)

(declare-fun b_and!17547 () Bool)

(assert (=> start!39596 (= tp!35160 b_and!17547)))

(declare-fun b!424430 () Bool)

(declare-fun res!248314 () Bool)

(declare-fun e!252120 () Bool)

(assert (=> b!424430 (=> (not res!248314) (not e!252120))))

(declare-datatypes ((array!25904 0))(
  ( (array!25905 (arr!12401 (Array (_ BitVec 32) (_ BitVec 64))) (size!12753 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25904)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424430 (= res!248314 (or (= (select (arr!12401 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12401 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!248306 () Bool)

(assert (=> start!39596 (=> (not res!248306) (not e!252120))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39596 (= res!248306 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12753 _keys!709))))))

(assert (=> start!39596 e!252120))

(declare-fun tp_is_empty!11029 () Bool)

(assert (=> start!39596 tp_is_empty!11029))

(assert (=> start!39596 tp!35160))

(assert (=> start!39596 true))

(declare-datatypes ((V!15811 0))(
  ( (V!15812 (val!5559 Int)) )
))
(declare-datatypes ((ValueCell!5171 0))(
  ( (ValueCellFull!5171 (v!7807 V!15811)) (EmptyCell!5171) )
))
(declare-datatypes ((array!25906 0))(
  ( (array!25907 (arr!12402 (Array (_ BitVec 32) ValueCell!5171)) (size!12754 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25906)

(declare-fun e!252124 () Bool)

(declare-fun array_inv!9104 (array!25906) Bool)

(assert (=> start!39596 (and (array_inv!9104 _values!549) e!252124)))

(declare-fun array_inv!9105 (array!25904) Bool)

(assert (=> start!39596 (array_inv!9105 _keys!709)))

(declare-fun b!424431 () Bool)

(declare-fun res!248312 () Bool)

(assert (=> b!424431 (=> (not res!248312) (not e!252120))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424431 (= res!248312 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18165 () Bool)

(declare-fun mapRes!18165 () Bool)

(declare-fun tp!35159 () Bool)

(declare-fun e!252121 () Bool)

(assert (=> mapNonEmpty!18165 (= mapRes!18165 (and tp!35159 e!252121))))

(declare-fun mapRest!18165 () (Array (_ BitVec 32) ValueCell!5171))

(declare-fun mapKey!18165 () (_ BitVec 32))

(declare-fun mapValue!18165 () ValueCell!5171)

(assert (=> mapNonEmpty!18165 (= (arr!12402 _values!549) (store mapRest!18165 mapKey!18165 mapValue!18165))))

(declare-fun b!424432 () Bool)

(declare-fun e!252122 () Bool)

(assert (=> b!424432 (= e!252122 false)))

(declare-fun lt!194395 () array!25904)

(declare-fun minValue!515 () V!15811)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15811)

(declare-datatypes ((tuple2!7188 0))(
  ( (tuple2!7189 (_1!3605 (_ BitVec 64)) (_2!3605 V!15811)) )
))
(declare-datatypes ((List!7194 0))(
  ( (Nil!7191) (Cons!7190 (h!8046 tuple2!7188) (t!12630 List!7194)) )
))
(declare-datatypes ((ListLongMap!6103 0))(
  ( (ListLongMap!6104 (toList!3067 List!7194)) )
))
(declare-fun lt!194397 () ListLongMap!6103)

(declare-fun v!412 () V!15811)

(declare-fun getCurrentListMapNoExtraKeys!1313 (array!25904 array!25906 (_ BitVec 32) (_ BitVec 32) V!15811 V!15811 (_ BitVec 32) Int) ListLongMap!6103)

(assert (=> b!424432 (= lt!194397 (getCurrentListMapNoExtraKeys!1313 lt!194395 (array!25907 (store (arr!12402 _values!549) i!563 (ValueCellFull!5171 v!412)) (size!12754 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194396 () ListLongMap!6103)

(assert (=> b!424432 (= lt!194396 (getCurrentListMapNoExtraKeys!1313 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424433 () Bool)

(declare-fun res!248315 () Bool)

(assert (=> b!424433 (=> (not res!248315) (not e!252122))))

(assert (=> b!424433 (= res!248315 (bvsle from!863 i!563))))

(declare-fun b!424434 () Bool)

(declare-fun res!248310 () Bool)

(assert (=> b!424434 (=> (not res!248310) (not e!252120))))

(declare-datatypes ((List!7195 0))(
  ( (Nil!7192) (Cons!7191 (h!8047 (_ BitVec 64)) (t!12631 List!7195)) )
))
(declare-fun arrayNoDuplicates!0 (array!25904 (_ BitVec 32) List!7195) Bool)

(assert (=> b!424434 (= res!248310 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7192))))

(declare-fun b!424435 () Bool)

(assert (=> b!424435 (= e!252120 e!252122)))

(declare-fun res!248309 () Bool)

(assert (=> b!424435 (=> (not res!248309) (not e!252122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25904 (_ BitVec 32)) Bool)

(assert (=> b!424435 (= res!248309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194395 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!424435 (= lt!194395 (array!25905 (store (arr!12401 _keys!709) i!563 k0!794) (size!12753 _keys!709)))))

(declare-fun b!424436 () Bool)

(declare-fun res!248308 () Bool)

(assert (=> b!424436 (=> (not res!248308) (not e!252120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424436 (= res!248308 (validKeyInArray!0 k0!794))))

(declare-fun b!424437 () Bool)

(assert (=> b!424437 (= e!252121 tp_is_empty!11029)))

(declare-fun b!424438 () Bool)

(declare-fun res!248307 () Bool)

(assert (=> b!424438 (=> (not res!248307) (not e!252120))))

(assert (=> b!424438 (= res!248307 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12753 _keys!709))))))

(declare-fun mapIsEmpty!18165 () Bool)

(assert (=> mapIsEmpty!18165 mapRes!18165))

(declare-fun b!424439 () Bool)

(declare-fun res!248313 () Bool)

(assert (=> b!424439 (=> (not res!248313) (not e!252120))))

(declare-fun arrayContainsKey!0 (array!25904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424439 (= res!248313 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424440 () Bool)

(declare-fun e!252123 () Bool)

(assert (=> b!424440 (= e!252123 tp_is_empty!11029)))

(declare-fun b!424441 () Bool)

(declare-fun res!248316 () Bool)

(assert (=> b!424441 (=> (not res!248316) (not e!252120))))

(assert (=> b!424441 (= res!248316 (and (= (size!12754 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12753 _keys!709) (size!12754 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424442 () Bool)

(assert (=> b!424442 (= e!252124 (and e!252123 mapRes!18165))))

(declare-fun condMapEmpty!18165 () Bool)

(declare-fun mapDefault!18165 () ValueCell!5171)

(assert (=> b!424442 (= condMapEmpty!18165 (= (arr!12402 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5171)) mapDefault!18165)))))

(declare-fun b!424443 () Bool)

(declare-fun res!248311 () Bool)

(assert (=> b!424443 (=> (not res!248311) (not e!252122))))

(assert (=> b!424443 (= res!248311 (arrayNoDuplicates!0 lt!194395 #b00000000000000000000000000000000 Nil!7192))))

(declare-fun b!424444 () Bool)

(declare-fun res!248305 () Bool)

(assert (=> b!424444 (=> (not res!248305) (not e!252120))))

(assert (=> b!424444 (= res!248305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39596 res!248306) b!424431))

(assert (= (and b!424431 res!248312) b!424441))

(assert (= (and b!424441 res!248316) b!424444))

(assert (= (and b!424444 res!248305) b!424434))

(assert (= (and b!424434 res!248310) b!424438))

(assert (= (and b!424438 res!248307) b!424436))

(assert (= (and b!424436 res!248308) b!424430))

(assert (= (and b!424430 res!248314) b!424439))

(assert (= (and b!424439 res!248313) b!424435))

(assert (= (and b!424435 res!248309) b!424443))

(assert (= (and b!424443 res!248311) b!424433))

(assert (= (and b!424433 res!248315) b!424432))

(assert (= (and b!424442 condMapEmpty!18165) mapIsEmpty!18165))

(assert (= (and b!424442 (not condMapEmpty!18165)) mapNonEmpty!18165))

(get-info :version)

(assert (= (and mapNonEmpty!18165 ((_ is ValueCellFull!5171) mapValue!18165)) b!424437))

(assert (= (and b!424442 ((_ is ValueCellFull!5171) mapDefault!18165)) b!424440))

(assert (= start!39596 b!424442))

(declare-fun m!413831 () Bool)

(assert (=> b!424443 m!413831))

(declare-fun m!413833 () Bool)

(assert (=> b!424432 m!413833))

(declare-fun m!413835 () Bool)

(assert (=> b!424432 m!413835))

(declare-fun m!413837 () Bool)

(assert (=> b!424432 m!413837))

(declare-fun m!413839 () Bool)

(assert (=> b!424431 m!413839))

(declare-fun m!413841 () Bool)

(assert (=> b!424430 m!413841))

(declare-fun m!413843 () Bool)

(assert (=> b!424444 m!413843))

(declare-fun m!413845 () Bool)

(assert (=> mapNonEmpty!18165 m!413845))

(declare-fun m!413847 () Bool)

(assert (=> b!424436 m!413847))

(declare-fun m!413849 () Bool)

(assert (=> b!424439 m!413849))

(declare-fun m!413851 () Bool)

(assert (=> b!424435 m!413851))

(declare-fun m!413853 () Bool)

(assert (=> b!424435 m!413853))

(declare-fun m!413855 () Bool)

(assert (=> start!39596 m!413855))

(declare-fun m!413857 () Bool)

(assert (=> start!39596 m!413857))

(declare-fun m!413859 () Bool)

(assert (=> b!424434 m!413859))

(check-sat (not mapNonEmpty!18165) (not b!424435) tp_is_empty!11029 (not b!424443) (not b!424444) (not b!424439) (not b_next!9877) b_and!17547 (not b!424432) (not b!424434) (not b!424436) (not start!39596) (not b!424431))
(check-sat b_and!17547 (not b_next!9877))
