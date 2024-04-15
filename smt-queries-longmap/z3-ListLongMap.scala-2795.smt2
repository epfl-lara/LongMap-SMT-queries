; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40644 () Bool)

(assert start!40644)

(declare-fun b_free!10669 () Bool)

(declare-fun b_next!10669 () Bool)

(assert (=> start!40644 (= b_free!10669 (not b_next!10669))))

(declare-fun tp!37826 () Bool)

(declare-fun b_and!18651 () Bool)

(assert (=> start!40644 (= tp!37826 b_and!18651)))

(declare-fun b!448952 () Bool)

(declare-fun res!267031 () Bool)

(declare-fun e!263268 () Bool)

(assert (=> b!448952 (=> (not res!267031) (not e!263268))))

(declare-datatypes ((array!27819 0))(
  ( (array!27820 (arr!13355 (Array (_ BitVec 32) (_ BitVec 64))) (size!13708 (_ BitVec 32))) )
))
(declare-fun lt!204090 () array!27819)

(declare-datatypes ((List!8012 0))(
  ( (Nil!8009) (Cons!8008 (h!8864 (_ BitVec 64)) (t!13765 List!8012)) )
))
(declare-fun arrayNoDuplicates!0 (array!27819 (_ BitVec 32) List!8012) Bool)

(assert (=> b!448952 (= res!267031 (arrayNoDuplicates!0 lt!204090 #b00000000000000000000000000000000 Nil!8009))))

(declare-fun b!448953 () Bool)

(declare-fun res!267037 () Bool)

(declare-fun e!263270 () Bool)

(assert (=> b!448953 (=> (not res!267037) (not e!263270))))

(declare-fun _keys!709 () array!27819)

(assert (=> b!448953 (= res!267037 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8009))))

(declare-fun b!448954 () Bool)

(declare-fun e!263269 () Bool)

(declare-fun tp_is_empty!12007 () Bool)

(assert (=> b!448954 (= e!263269 tp_is_empty!12007)))

(declare-fun b!448955 () Bool)

(declare-fun e!263265 () Bool)

(declare-fun e!263266 () Bool)

(declare-fun mapRes!19644 () Bool)

(assert (=> b!448955 (= e!263265 (and e!263266 mapRes!19644))))

(declare-fun condMapEmpty!19644 () Bool)

(declare-datatypes ((V!17115 0))(
  ( (V!17116 (val!6048 Int)) )
))
(declare-datatypes ((ValueCell!5660 0))(
  ( (ValueCellFull!5660 (v!8297 V!17115)) (EmptyCell!5660) )
))
(declare-datatypes ((array!27821 0))(
  ( (array!27822 (arr!13356 (Array (_ BitVec 32) ValueCell!5660)) (size!13709 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27821)

(declare-fun mapDefault!19644 () ValueCell!5660)

(assert (=> b!448955 (= condMapEmpty!19644 (= (arr!13356 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5660)) mapDefault!19644)))))

(declare-fun b!448956 () Bool)

(declare-fun res!267040 () Bool)

(assert (=> b!448956 (=> (not res!267040) (not e!263270))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!448956 (= res!267040 (and (= (size!13709 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13708 _keys!709) (size!13709 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448957 () Bool)

(assert (=> b!448957 (= e!263270 e!263268)))

(declare-fun res!267042 () Bool)

(assert (=> b!448957 (=> (not res!267042) (not e!263268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27819 (_ BitVec 32)) Bool)

(assert (=> b!448957 (= res!267042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204090 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!448957 (= lt!204090 (array!27820 (store (arr!13355 _keys!709) i!563 k0!794) (size!13708 _keys!709)))))

(declare-fun b!448958 () Bool)

(declare-fun res!267032 () Bool)

(assert (=> b!448958 (=> (not res!267032) (not e!263270))))

(assert (=> b!448958 (= res!267032 (or (= (select (arr!13355 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13355 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448959 () Bool)

(declare-fun res!267035 () Bool)

(assert (=> b!448959 (=> (not res!267035) (not e!263270))))

(assert (=> b!448959 (= res!267035 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13708 _keys!709))))))

(declare-fun b!448960 () Bool)

(assert (=> b!448960 (= e!263266 tp_is_empty!12007)))

(declare-fun b!448961 () Bool)

(declare-fun res!267034 () Bool)

(assert (=> b!448961 (=> (not res!267034) (not e!263270))))

(assert (=> b!448961 (= res!267034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448951 () Bool)

(declare-fun res!267038 () Bool)

(assert (=> b!448951 (=> (not res!267038) (not e!263270))))

(declare-fun arrayContainsKey!0 (array!27819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448951 (= res!267038 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!267041 () Bool)

(assert (=> start!40644 (=> (not res!267041) (not e!263270))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40644 (= res!267041 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13708 _keys!709))))))

(assert (=> start!40644 e!263270))

(assert (=> start!40644 tp_is_empty!12007))

(assert (=> start!40644 tp!37826))

(assert (=> start!40644 true))

(declare-fun array_inv!9734 (array!27821) Bool)

(assert (=> start!40644 (and (array_inv!9734 _values!549) e!263265)))

(declare-fun array_inv!9735 (array!27819) Bool)

(assert (=> start!40644 (array_inv!9735 _keys!709)))

(declare-fun mapNonEmpty!19644 () Bool)

(declare-fun tp!37827 () Bool)

(assert (=> mapNonEmpty!19644 (= mapRes!19644 (and tp!37827 e!263269))))

(declare-fun mapRest!19644 () (Array (_ BitVec 32) ValueCell!5660))

(declare-fun mapValue!19644 () ValueCell!5660)

(declare-fun mapKey!19644 () (_ BitVec 32))

(assert (=> mapNonEmpty!19644 (= (arr!13356 _values!549) (store mapRest!19644 mapKey!19644 mapValue!19644))))

(declare-fun b!448962 () Bool)

(declare-fun res!267036 () Bool)

(assert (=> b!448962 (=> (not res!267036) (not e!263268))))

(assert (=> b!448962 (= res!267036 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19644 () Bool)

(assert (=> mapIsEmpty!19644 mapRes!19644))

(declare-fun b!448963 () Bool)

(declare-fun res!267039 () Bool)

(assert (=> b!448963 (=> (not res!267039) (not e!263270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448963 (= res!267039 (validMask!0 mask!1025))))

(declare-fun b!448964 () Bool)

(declare-fun res!267033 () Bool)

(assert (=> b!448964 (=> (not res!267033) (not e!263270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448964 (= res!267033 (validKeyInArray!0 k0!794))))

(declare-fun b!448965 () Bool)

(assert (=> b!448965 (= e!263268 false)))

(declare-fun minValue!515 () V!17115)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7948 0))(
  ( (tuple2!7949 (_1!3985 (_ BitVec 64)) (_2!3985 V!17115)) )
))
(declare-datatypes ((List!8013 0))(
  ( (Nil!8010) (Cons!8009 (h!8865 tuple2!7948) (t!13766 List!8013)) )
))
(declare-datatypes ((ListLongMap!6851 0))(
  ( (ListLongMap!6852 (toList!3441 List!8013)) )
))
(declare-fun lt!204089 () ListLongMap!6851)

(declare-fun zeroValue!515 () V!17115)

(declare-fun v!412 () V!17115)

(declare-fun getCurrentListMapNoExtraKeys!1639 (array!27819 array!27821 (_ BitVec 32) (_ BitVec 32) V!17115 V!17115 (_ BitVec 32) Int) ListLongMap!6851)

(assert (=> b!448965 (= lt!204089 (getCurrentListMapNoExtraKeys!1639 lt!204090 (array!27822 (store (arr!13356 _values!549) i!563 (ValueCellFull!5660 v!412)) (size!13709 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204088 () ListLongMap!6851)

(assert (=> b!448965 (= lt!204088 (getCurrentListMapNoExtraKeys!1639 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40644 res!267041) b!448963))

(assert (= (and b!448963 res!267039) b!448956))

(assert (= (and b!448956 res!267040) b!448961))

(assert (= (and b!448961 res!267034) b!448953))

(assert (= (and b!448953 res!267037) b!448959))

(assert (= (and b!448959 res!267035) b!448964))

(assert (= (and b!448964 res!267033) b!448958))

(assert (= (and b!448958 res!267032) b!448951))

(assert (= (and b!448951 res!267038) b!448957))

(assert (= (and b!448957 res!267042) b!448952))

(assert (= (and b!448952 res!267031) b!448962))

(assert (= (and b!448962 res!267036) b!448965))

(assert (= (and b!448955 condMapEmpty!19644) mapIsEmpty!19644))

(assert (= (and b!448955 (not condMapEmpty!19644)) mapNonEmpty!19644))

(get-info :version)

(assert (= (and mapNonEmpty!19644 ((_ is ValueCellFull!5660) mapValue!19644)) b!448954))

(assert (= (and b!448955 ((_ is ValueCellFull!5660) mapDefault!19644)) b!448960))

(assert (= start!40644 b!448955))

(declare-fun m!432781 () Bool)

(assert (=> b!448964 m!432781))

(declare-fun m!432783 () Bool)

(assert (=> mapNonEmpty!19644 m!432783))

(declare-fun m!432785 () Bool)

(assert (=> b!448963 m!432785))

(declare-fun m!432787 () Bool)

(assert (=> b!448952 m!432787))

(declare-fun m!432789 () Bool)

(assert (=> start!40644 m!432789))

(declare-fun m!432791 () Bool)

(assert (=> start!40644 m!432791))

(declare-fun m!432793 () Bool)

(assert (=> b!448958 m!432793))

(declare-fun m!432795 () Bool)

(assert (=> b!448957 m!432795))

(declare-fun m!432797 () Bool)

(assert (=> b!448957 m!432797))

(declare-fun m!432799 () Bool)

(assert (=> b!448953 m!432799))

(declare-fun m!432801 () Bool)

(assert (=> b!448965 m!432801))

(declare-fun m!432803 () Bool)

(assert (=> b!448965 m!432803))

(declare-fun m!432805 () Bool)

(assert (=> b!448965 m!432805))

(declare-fun m!432807 () Bool)

(assert (=> b!448961 m!432807))

(declare-fun m!432809 () Bool)

(assert (=> b!448951 m!432809))

(check-sat (not b!448957) (not b!448961) tp_is_empty!12007 (not b!448963) (not b!448964) (not start!40644) (not b!448965) b_and!18651 (not b_next!10669) (not b!448952) (not b!448951) (not mapNonEmpty!19644) (not b!448953))
(check-sat b_and!18651 (not b_next!10669))
