; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39684 () Bool)

(assert start!39684)

(declare-fun b_free!9951 () Bool)

(declare-fun b_next!9951 () Bool)

(assert (=> start!39684 (= b_free!9951 (not b_next!9951))))

(declare-fun tp!35381 () Bool)

(declare-fun b_and!17607 () Bool)

(assert (=> start!39684 (= tp!35381 b_and!17607)))

(declare-fun b!426239 () Bool)

(declare-fun e!252912 () Bool)

(declare-fun tp_is_empty!11103 () Bool)

(assert (=> b!426239 (= e!252912 tp_is_empty!11103)))

(declare-fun b!426240 () Bool)

(declare-fun res!249744 () Bool)

(declare-fun e!252915 () Bool)

(assert (=> b!426240 (=> (not res!249744) (not e!252915))))

(declare-datatypes ((array!26045 0))(
  ( (array!26046 (arr!12472 (Array (_ BitVec 32) (_ BitVec 64))) (size!12824 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26045)

(declare-datatypes ((List!7364 0))(
  ( (Nil!7361) (Cons!7360 (h!8216 (_ BitVec 64)) (t!12808 List!7364)) )
))
(declare-fun arrayNoDuplicates!0 (array!26045 (_ BitVec 32) List!7364) Bool)

(assert (=> b!426240 (= res!249744 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7361))))

(declare-fun b!426241 () Bool)

(declare-fun e!252916 () Bool)

(declare-fun mapRes!18276 () Bool)

(assert (=> b!426241 (= e!252916 (and e!252912 mapRes!18276))))

(declare-fun condMapEmpty!18276 () Bool)

(declare-datatypes ((V!15909 0))(
  ( (V!15910 (val!5596 Int)) )
))
(declare-datatypes ((ValueCell!5208 0))(
  ( (ValueCellFull!5208 (v!7843 V!15909)) (EmptyCell!5208) )
))
(declare-datatypes ((array!26047 0))(
  ( (array!26048 (arr!12473 (Array (_ BitVec 32) ValueCell!5208)) (size!12825 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26047)

(declare-fun mapDefault!18276 () ValueCell!5208)

(assert (=> b!426241 (= condMapEmpty!18276 (= (arr!12473 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5208)) mapDefault!18276)))))

(declare-fun mapNonEmpty!18276 () Bool)

(declare-fun tp!35382 () Bool)

(declare-fun e!252914 () Bool)

(assert (=> mapNonEmpty!18276 (= mapRes!18276 (and tp!35382 e!252914))))

(declare-fun mapValue!18276 () ValueCell!5208)

(declare-fun mapRest!18276 () (Array (_ BitVec 32) ValueCell!5208))

(declare-fun mapKey!18276 () (_ BitVec 32))

(assert (=> mapNonEmpty!18276 (= (arr!12473 _values!549) (store mapRest!18276 mapKey!18276 mapValue!18276))))

(declare-fun b!426242 () Bool)

(declare-fun res!249745 () Bool)

(assert (=> b!426242 (=> (not res!249745) (not e!252915))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426242 (= res!249745 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12824 _keys!709))))))

(declare-fun b!426243 () Bool)

(declare-fun res!249735 () Bool)

(assert (=> b!426243 (=> (not res!249735) (not e!252915))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!426243 (= res!249735 (and (= (size!12825 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12824 _keys!709) (size!12825 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!249736 () Bool)

(assert (=> start!39684 (=> (not res!249736) (not e!252915))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39684 (= res!249736 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12824 _keys!709))))))

(assert (=> start!39684 e!252915))

(assert (=> start!39684 tp_is_empty!11103))

(assert (=> start!39684 tp!35381))

(assert (=> start!39684 true))

(declare-fun array_inv!9090 (array!26047) Bool)

(assert (=> start!39684 (and (array_inv!9090 _values!549) e!252916)))

(declare-fun array_inv!9091 (array!26045) Bool)

(assert (=> start!39684 (array_inv!9091 _keys!709)))

(declare-fun b!426244 () Bool)

(declare-fun e!252917 () Bool)

(assert (=> b!426244 (= e!252915 e!252917)))

(declare-fun res!249747 () Bool)

(assert (=> b!426244 (=> (not res!249747) (not e!252917))))

(declare-fun lt!194902 () array!26045)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26045 (_ BitVec 32)) Bool)

(assert (=> b!426244 (= res!249747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194902 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!426244 (= lt!194902 (array!26046 (store (arr!12472 _keys!709) i!563 k0!794) (size!12824 _keys!709)))))

(declare-fun mapIsEmpty!18276 () Bool)

(assert (=> mapIsEmpty!18276 mapRes!18276))

(declare-fun b!426245 () Bool)

(declare-fun e!252913 () Bool)

(assert (=> b!426245 (= e!252917 e!252913)))

(declare-fun res!249738 () Bool)

(assert (=> b!426245 (=> (not res!249738) (not e!252913))))

(assert (=> b!426245 (= res!249738 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15909)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!194899 () array!26047)

(declare-fun zeroValue!515 () V!15909)

(declare-datatypes ((tuple2!7350 0))(
  ( (tuple2!7351 (_1!3686 (_ BitVec 64)) (_2!3686 V!15909)) )
))
(declare-datatypes ((List!7365 0))(
  ( (Nil!7362) (Cons!7361 (h!8217 tuple2!7350) (t!12809 List!7365)) )
))
(declare-datatypes ((ListLongMap!6263 0))(
  ( (ListLongMap!6264 (toList!3147 List!7365)) )
))
(declare-fun lt!194901 () ListLongMap!6263)

(declare-fun getCurrentListMapNoExtraKeys!1351 (array!26045 array!26047 (_ BitVec 32) (_ BitVec 32) V!15909 V!15909 (_ BitVec 32) Int) ListLongMap!6263)

(assert (=> b!426245 (= lt!194901 (getCurrentListMapNoExtraKeys!1351 lt!194902 lt!194899 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15909)

(assert (=> b!426245 (= lt!194899 (array!26048 (store (arr!12473 _values!549) i!563 (ValueCellFull!5208 v!412)) (size!12825 _values!549)))))

(declare-fun lt!194900 () ListLongMap!6263)

(assert (=> b!426245 (= lt!194900 (getCurrentListMapNoExtraKeys!1351 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426246 () Bool)

(declare-fun res!249743 () Bool)

(assert (=> b!426246 (=> (not res!249743) (not e!252917))))

(assert (=> b!426246 (= res!249743 (bvsle from!863 i!563))))

(declare-fun b!426247 () Bool)

(declare-fun res!249740 () Bool)

(assert (=> b!426247 (=> (not res!249740) (not e!252915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426247 (= res!249740 (validMask!0 mask!1025))))

(declare-fun b!426248 () Bool)

(declare-fun res!249741 () Bool)

(assert (=> b!426248 (=> (not res!249741) (not e!252915))))

(declare-fun arrayContainsKey!0 (array!26045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426248 (= res!249741 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426249 () Bool)

(declare-fun res!249737 () Bool)

(assert (=> b!426249 (=> (not res!249737) (not e!252917))))

(assert (=> b!426249 (= res!249737 (arrayNoDuplicates!0 lt!194902 #b00000000000000000000000000000000 Nil!7361))))

(declare-fun b!426250 () Bool)

(assert (=> b!426250 (= e!252913 (not true))))

(declare-fun +!1305 (ListLongMap!6263 tuple2!7350) ListLongMap!6263)

(assert (=> b!426250 (= (getCurrentListMapNoExtraKeys!1351 lt!194902 lt!194899 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1305 (getCurrentListMapNoExtraKeys!1351 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7351 k0!794 v!412)))))

(declare-datatypes ((Unit!12512 0))(
  ( (Unit!12513) )
))
(declare-fun lt!194903 () Unit!12512)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!500 (array!26045 array!26047 (_ BitVec 32) (_ BitVec 32) V!15909 V!15909 (_ BitVec 32) (_ BitVec 64) V!15909 (_ BitVec 32) Int) Unit!12512)

(assert (=> b!426250 (= lt!194903 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!500 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426251 () Bool)

(declare-fun res!249746 () Bool)

(assert (=> b!426251 (=> (not res!249746) (not e!252915))))

(assert (=> b!426251 (= res!249746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426252 () Bool)

(declare-fun res!249742 () Bool)

(assert (=> b!426252 (=> (not res!249742) (not e!252915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426252 (= res!249742 (validKeyInArray!0 k0!794))))

(declare-fun b!426253 () Bool)

(assert (=> b!426253 (= e!252914 tp_is_empty!11103)))

(declare-fun b!426254 () Bool)

(declare-fun res!249739 () Bool)

(assert (=> b!426254 (=> (not res!249739) (not e!252915))))

(assert (=> b!426254 (= res!249739 (or (= (select (arr!12472 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12472 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39684 res!249736) b!426247))

(assert (= (and b!426247 res!249740) b!426243))

(assert (= (and b!426243 res!249735) b!426251))

(assert (= (and b!426251 res!249746) b!426240))

(assert (= (and b!426240 res!249744) b!426242))

(assert (= (and b!426242 res!249745) b!426252))

(assert (= (and b!426252 res!249742) b!426254))

(assert (= (and b!426254 res!249739) b!426248))

(assert (= (and b!426248 res!249741) b!426244))

(assert (= (and b!426244 res!249747) b!426249))

(assert (= (and b!426249 res!249737) b!426246))

(assert (= (and b!426246 res!249743) b!426245))

(assert (= (and b!426245 res!249738) b!426250))

(assert (= (and b!426241 condMapEmpty!18276) mapIsEmpty!18276))

(assert (= (and b!426241 (not condMapEmpty!18276)) mapNonEmpty!18276))

(get-info :version)

(assert (= (and mapNonEmpty!18276 ((_ is ValueCellFull!5208) mapValue!18276)) b!426253))

(assert (= (and b!426241 ((_ is ValueCellFull!5208) mapDefault!18276)) b!426239))

(assert (= start!39684 b!426241))

(declare-fun m!414971 () Bool)

(assert (=> b!426254 m!414971))

(declare-fun m!414973 () Bool)

(assert (=> b!426244 m!414973))

(declare-fun m!414975 () Bool)

(assert (=> b!426244 m!414975))

(declare-fun m!414977 () Bool)

(assert (=> mapNonEmpty!18276 m!414977))

(declare-fun m!414979 () Bool)

(assert (=> start!39684 m!414979))

(declare-fun m!414981 () Bool)

(assert (=> start!39684 m!414981))

(declare-fun m!414983 () Bool)

(assert (=> b!426252 m!414983))

(declare-fun m!414985 () Bool)

(assert (=> b!426245 m!414985))

(declare-fun m!414987 () Bool)

(assert (=> b!426245 m!414987))

(declare-fun m!414989 () Bool)

(assert (=> b!426245 m!414989))

(declare-fun m!414991 () Bool)

(assert (=> b!426240 m!414991))

(declare-fun m!414993 () Bool)

(assert (=> b!426248 m!414993))

(declare-fun m!414995 () Bool)

(assert (=> b!426251 m!414995))

(declare-fun m!414997 () Bool)

(assert (=> b!426250 m!414997))

(declare-fun m!414999 () Bool)

(assert (=> b!426250 m!414999))

(assert (=> b!426250 m!414999))

(declare-fun m!415001 () Bool)

(assert (=> b!426250 m!415001))

(declare-fun m!415003 () Bool)

(assert (=> b!426250 m!415003))

(declare-fun m!415005 () Bool)

(assert (=> b!426247 m!415005))

(declare-fun m!415007 () Bool)

(assert (=> b!426249 m!415007))

(check-sat (not mapNonEmpty!18276) b_and!17607 (not b!426245) (not b!426251) (not b!426247) tp_is_empty!11103 (not start!39684) (not b!426249) (not b_next!9951) (not b!426248) (not b!426240) (not b!426244) (not b!426250) (not b!426252))
(check-sat b_and!17607 (not b_next!9951))
