; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38038 () Bool)

(assert start!38038)

(declare-fun b_free!8985 () Bool)

(declare-fun b_next!8985 () Bool)

(assert (=> start!38038 (= b_free!8985 (not b_next!8985))))

(declare-fun tp!31727 () Bool)

(declare-fun b_and!16311 () Bool)

(assert (=> start!38038 (= tp!31727 b_and!16311)))

(declare-fun b!391572 () Bool)

(declare-fun res!224155 () Bool)

(declare-fun e!237159 () Bool)

(assert (=> b!391572 (=> (not res!224155) (not e!237159))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391572 (= res!224155 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!16071 () Bool)

(declare-fun mapRes!16071 () Bool)

(assert (=> mapIsEmpty!16071 mapRes!16071))

(declare-fun b!391573 () Bool)

(declare-fun res!224161 () Bool)

(assert (=> b!391573 (=> (not res!224161) (not e!237159))))

(declare-datatypes ((array!23217 0))(
  ( (array!23218 (arr!11070 (Array (_ BitVec 32) (_ BitVec 64))) (size!11422 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23217)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391573 (= res!224161 (or (= (select (arr!11070 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11070 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391574 () Bool)

(declare-fun res!224157 () Bool)

(assert (=> b!391574 (=> (not res!224157) (not e!237159))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23217 (_ BitVec 32)) Bool)

(assert (=> b!391574 (= res!224157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!16071 () Bool)

(declare-fun tp!31728 () Bool)

(declare-fun e!237161 () Bool)

(assert (=> mapNonEmpty!16071 (= mapRes!16071 (and tp!31728 e!237161))))

(declare-fun mapKey!16071 () (_ BitVec 32))

(declare-datatypes ((V!13981 0))(
  ( (V!13982 (val!4873 Int)) )
))
(declare-datatypes ((ValueCell!4485 0))(
  ( (ValueCellFull!4485 (v!7098 V!13981)) (EmptyCell!4485) )
))
(declare-datatypes ((array!23219 0))(
  ( (array!23220 (arr!11071 (Array (_ BitVec 32) ValueCell!4485)) (size!11423 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23219)

(declare-fun mapValue!16071 () ValueCell!4485)

(declare-fun mapRest!16071 () (Array (_ BitVec 32) ValueCell!4485))

(assert (=> mapNonEmpty!16071 (= (arr!11071 _values!506) (store mapRest!16071 mapKey!16071 mapValue!16071))))

(declare-fun b!391575 () Bool)

(declare-fun res!224156 () Bool)

(assert (=> b!391575 (=> (not res!224156) (not e!237159))))

(assert (=> b!391575 (= res!224156 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11422 _keys!658))))))

(declare-fun b!391576 () Bool)

(declare-fun e!237163 () Bool)

(assert (=> b!391576 (= e!237159 e!237163)))

(declare-fun res!224153 () Bool)

(assert (=> b!391576 (=> (not res!224153) (not e!237163))))

(declare-fun lt!184825 () array!23217)

(assert (=> b!391576 (= res!224153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184825 mask!970))))

(assert (=> b!391576 (= lt!184825 (array!23218 (store (arr!11070 _keys!658) i!548 k0!778) (size!11422 _keys!658)))))

(declare-fun b!391577 () Bool)

(declare-fun e!237164 () Bool)

(assert (=> b!391577 (= e!237163 (not e!237164))))

(declare-fun res!224159 () Bool)

(assert (=> b!391577 (=> res!224159 e!237164)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391577 (= res!224159 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6566 0))(
  ( (tuple2!6567 (_1!3294 (_ BitVec 64)) (_2!3294 V!13981)) )
))
(declare-datatypes ((List!6420 0))(
  ( (Nil!6417) (Cons!6416 (h!7272 tuple2!6566) (t!11584 List!6420)) )
))
(declare-datatypes ((ListLongMap!5479 0))(
  ( (ListLongMap!5480 (toList!2755 List!6420)) )
))
(declare-fun lt!184835 () ListLongMap!5479)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13981)

(declare-fun minValue!472 () V!13981)

(declare-fun getCurrentListMap!2098 (array!23217 array!23219 (_ BitVec 32) (_ BitVec 32) V!13981 V!13981 (_ BitVec 32) Int) ListLongMap!5479)

(assert (=> b!391577 (= lt!184835 (getCurrentListMap!2098 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184828 () ListLongMap!5479)

(declare-fun lt!184829 () array!23219)

(assert (=> b!391577 (= lt!184828 (getCurrentListMap!2098 lt!184825 lt!184829 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184836 () ListLongMap!5479)

(declare-fun lt!184834 () ListLongMap!5479)

(assert (=> b!391577 (and (= lt!184836 lt!184834) (= lt!184834 lt!184836))))

(declare-fun lt!184831 () ListLongMap!5479)

(declare-fun lt!184824 () tuple2!6566)

(declare-fun +!1050 (ListLongMap!5479 tuple2!6566) ListLongMap!5479)

(assert (=> b!391577 (= lt!184834 (+!1050 lt!184831 lt!184824))))

(declare-fun v!373 () V!13981)

(assert (=> b!391577 (= lt!184824 (tuple2!6567 k0!778 v!373))))

(declare-datatypes ((Unit!11982 0))(
  ( (Unit!11983) )
))
(declare-fun lt!184830 () Unit!11982)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!262 (array!23217 array!23219 (_ BitVec 32) (_ BitVec 32) V!13981 V!13981 (_ BitVec 32) (_ BitVec 64) V!13981 (_ BitVec 32) Int) Unit!11982)

(assert (=> b!391577 (= lt!184830 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!262 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!978 (array!23217 array!23219 (_ BitVec 32) (_ BitVec 32) V!13981 V!13981 (_ BitVec 32) Int) ListLongMap!5479)

(assert (=> b!391577 (= lt!184836 (getCurrentListMapNoExtraKeys!978 lt!184825 lt!184829 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391577 (= lt!184829 (array!23220 (store (arr!11071 _values!506) i!548 (ValueCellFull!4485 v!373)) (size!11423 _values!506)))))

(assert (=> b!391577 (= lt!184831 (getCurrentListMapNoExtraKeys!978 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391578 () Bool)

(declare-fun tp_is_empty!9657 () Bool)

(assert (=> b!391578 (= e!237161 tp_is_empty!9657)))

(declare-fun b!391579 () Bool)

(declare-fun res!224160 () Bool)

(assert (=> b!391579 (=> (not res!224160) (not e!237163))))

(declare-datatypes ((List!6421 0))(
  ( (Nil!6418) (Cons!6417 (h!7273 (_ BitVec 64)) (t!11585 List!6421)) )
))
(declare-fun arrayNoDuplicates!0 (array!23217 (_ BitVec 32) List!6421) Bool)

(assert (=> b!391579 (= res!224160 (arrayNoDuplicates!0 lt!184825 #b00000000000000000000000000000000 Nil!6418))))

(declare-fun b!391580 () Bool)

(declare-fun res!224154 () Bool)

(assert (=> b!391580 (=> (not res!224154) (not e!237159))))

(assert (=> b!391580 (= res!224154 (and (= (size!11423 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11422 _keys!658) (size!11423 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!224158 () Bool)

(assert (=> start!38038 (=> (not res!224158) (not e!237159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38038 (= res!224158 (validMask!0 mask!970))))

(assert (=> start!38038 e!237159))

(declare-fun e!237160 () Bool)

(declare-fun array_inv!8130 (array!23219) Bool)

(assert (=> start!38038 (and (array_inv!8130 _values!506) e!237160)))

(assert (=> start!38038 tp!31727))

(assert (=> start!38038 true))

(assert (=> start!38038 tp_is_empty!9657))

(declare-fun array_inv!8131 (array!23217) Bool)

(assert (=> start!38038 (array_inv!8131 _keys!658)))

(declare-fun b!391581 () Bool)

(declare-fun e!237165 () Bool)

(assert (=> b!391581 (= e!237165 tp_is_empty!9657)))

(declare-fun b!391582 () Bool)

(declare-fun res!224164 () Bool)

(assert (=> b!391582 (=> (not res!224164) (not e!237159))))

(declare-fun arrayContainsKey!0 (array!23217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391582 (= res!224164 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391583 () Bool)

(declare-fun res!224163 () Bool)

(assert (=> b!391583 (=> (not res!224163) (not e!237159))))

(assert (=> b!391583 (= res!224163 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6418))))

(declare-fun b!391584 () Bool)

(declare-fun e!237158 () Bool)

(assert (=> b!391584 (= e!237164 e!237158)))

(declare-fun res!224162 () Bool)

(assert (=> b!391584 (=> res!224162 e!237158)))

(assert (=> b!391584 (= res!224162 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!184827 () ListLongMap!5479)

(assert (=> b!391584 (= lt!184828 lt!184827)))

(declare-fun lt!184832 () tuple2!6566)

(assert (=> b!391584 (= lt!184827 (+!1050 lt!184834 lt!184832))))

(declare-fun lt!184833 () ListLongMap!5479)

(assert (=> b!391584 (= lt!184835 lt!184833)))

(assert (=> b!391584 (= lt!184833 (+!1050 lt!184831 lt!184832))))

(assert (=> b!391584 (= lt!184828 (+!1050 lt!184836 lt!184832))))

(assert (=> b!391584 (= lt!184832 (tuple2!6567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391585 () Bool)

(assert (=> b!391585 (= e!237160 (and e!237165 mapRes!16071))))

(declare-fun condMapEmpty!16071 () Bool)

(declare-fun mapDefault!16071 () ValueCell!4485)

(assert (=> b!391585 (= condMapEmpty!16071 (= (arr!11071 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4485)) mapDefault!16071)))))

(declare-fun b!391586 () Bool)

(assert (=> b!391586 (= e!237158 (bvslt i!548 (size!11423 _values!506)))))

(assert (=> b!391586 (= lt!184827 (+!1050 lt!184833 lt!184824))))

(declare-fun lt!184826 () Unit!11982)

(declare-fun addCommutativeForDiffKeys!341 (ListLongMap!5479 (_ BitVec 64) V!13981 (_ BitVec 64) V!13981) Unit!11982)

(assert (=> b!391586 (= lt!184826 (addCommutativeForDiffKeys!341 lt!184831 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!38038 res!224158) b!391580))

(assert (= (and b!391580 res!224154) b!391574))

(assert (= (and b!391574 res!224157) b!391583))

(assert (= (and b!391583 res!224163) b!391575))

(assert (= (and b!391575 res!224156) b!391572))

(assert (= (and b!391572 res!224155) b!391573))

(assert (= (and b!391573 res!224161) b!391582))

(assert (= (and b!391582 res!224164) b!391576))

(assert (= (and b!391576 res!224153) b!391579))

(assert (= (and b!391579 res!224160) b!391577))

(assert (= (and b!391577 (not res!224159)) b!391584))

(assert (= (and b!391584 (not res!224162)) b!391586))

(assert (= (and b!391585 condMapEmpty!16071) mapIsEmpty!16071))

(assert (= (and b!391585 (not condMapEmpty!16071)) mapNonEmpty!16071))

(get-info :version)

(assert (= (and mapNonEmpty!16071 ((_ is ValueCellFull!4485) mapValue!16071)) b!391578))

(assert (= (and b!391585 ((_ is ValueCellFull!4485) mapDefault!16071)) b!391581))

(assert (= start!38038 b!391585))

(declare-fun m!387947 () Bool)

(assert (=> b!391586 m!387947))

(declare-fun m!387949 () Bool)

(assert (=> b!391586 m!387949))

(declare-fun m!387951 () Bool)

(assert (=> b!391576 m!387951))

(declare-fun m!387953 () Bool)

(assert (=> b!391576 m!387953))

(declare-fun m!387955 () Bool)

(assert (=> b!391582 m!387955))

(declare-fun m!387957 () Bool)

(assert (=> start!38038 m!387957))

(declare-fun m!387959 () Bool)

(assert (=> start!38038 m!387959))

(declare-fun m!387961 () Bool)

(assert (=> start!38038 m!387961))

(declare-fun m!387963 () Bool)

(assert (=> b!391584 m!387963))

(declare-fun m!387965 () Bool)

(assert (=> b!391584 m!387965))

(declare-fun m!387967 () Bool)

(assert (=> b!391584 m!387967))

(declare-fun m!387969 () Bool)

(assert (=> b!391579 m!387969))

(declare-fun m!387971 () Bool)

(assert (=> b!391583 m!387971))

(declare-fun m!387973 () Bool)

(assert (=> b!391574 m!387973))

(declare-fun m!387975 () Bool)

(assert (=> mapNonEmpty!16071 m!387975))

(declare-fun m!387977 () Bool)

(assert (=> b!391572 m!387977))

(declare-fun m!387979 () Bool)

(assert (=> b!391573 m!387979))

(declare-fun m!387981 () Bool)

(assert (=> b!391577 m!387981))

(declare-fun m!387983 () Bool)

(assert (=> b!391577 m!387983))

(declare-fun m!387985 () Bool)

(assert (=> b!391577 m!387985))

(declare-fun m!387987 () Bool)

(assert (=> b!391577 m!387987))

(declare-fun m!387989 () Bool)

(assert (=> b!391577 m!387989))

(declare-fun m!387991 () Bool)

(assert (=> b!391577 m!387991))

(declare-fun m!387993 () Bool)

(assert (=> b!391577 m!387993))

(check-sat (not b!391577) b_and!16311 (not b!391576) (not mapNonEmpty!16071) (not b!391582) (not b!391583) tp_is_empty!9657 (not b!391572) (not b_next!8985) (not start!38038) (not b!391574) (not b!391584) (not b!391586) (not b!391579))
(check-sat b_and!16311 (not b_next!8985))
