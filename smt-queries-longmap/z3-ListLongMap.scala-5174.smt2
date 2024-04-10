; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70032 () Bool)

(assert start!70032)

(declare-fun b_free!12453 () Bool)

(declare-fun b_next!12453 () Bool)

(assert (=> start!70032 (= b_free!12453 (not b_next!12453))))

(declare-fun tp!44074 () Bool)

(declare-fun b_and!21225 () Bool)

(assert (=> start!70032 (= tp!44074 b_and!21225)))

(declare-fun res!555977 () Bool)

(declare-fun e!451083 () Bool)

(assert (=> start!70032 (=> (not res!555977) (not e!451083))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70032 (= res!555977 (validMask!0 mask!1312))))

(assert (=> start!70032 e!451083))

(declare-fun tp_is_empty!14163 () Bool)

(assert (=> start!70032 tp_is_empty!14163))

(declare-datatypes ((array!44532 0))(
  ( (array!44533 (arr!21326 (Array (_ BitVec 32) (_ BitVec 64))) (size!21747 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44532)

(declare-fun array_inv!17077 (array!44532) Bool)

(assert (=> start!70032 (array_inv!17077 _keys!976)))

(assert (=> start!70032 true))

(declare-datatypes ((V!23885 0))(
  ( (V!23886 (val!7129 Int)) )
))
(declare-datatypes ((ValueCell!6666 0))(
  ( (ValueCellFull!6666 (v!9556 V!23885)) (EmptyCell!6666) )
))
(declare-datatypes ((array!44534 0))(
  ( (array!44535 (arr!21327 (Array (_ BitVec 32) ValueCell!6666)) (size!21748 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44534)

(declare-fun e!451082 () Bool)

(declare-fun array_inv!17078 (array!44534) Bool)

(assert (=> start!70032 (and (array_inv!17078 _values!788) e!451082)))

(assert (=> start!70032 tp!44074))

(declare-fun b!813911 () Bool)

(declare-fun e!451080 () Bool)

(assert (=> b!813911 (= e!451080 tp_is_empty!14163)))

(declare-fun mapIsEmpty!22825 () Bool)

(declare-fun mapRes!22825 () Bool)

(assert (=> mapIsEmpty!22825 mapRes!22825))

(declare-fun b!813912 () Bool)

(declare-fun res!555976 () Bool)

(assert (=> b!813912 (=> (not res!555976) (not e!451083))))

(declare-datatypes ((List!15172 0))(
  ( (Nil!15169) (Cons!15168 (h!16297 (_ BitVec 64)) (t!21489 List!15172)) )
))
(declare-fun arrayNoDuplicates!0 (array!44532 (_ BitVec 32) List!15172) Bool)

(assert (=> b!813912 (= res!555976 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15169))))

(declare-fun b!813913 () Bool)

(declare-fun e!451079 () Bool)

(assert (=> b!813913 (= e!451079 tp_is_empty!14163)))

(declare-fun b!813914 () Bool)

(declare-fun res!555975 () Bool)

(assert (=> b!813914 (=> (not res!555975) (not e!451083))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813914 (= res!555975 (and (= (size!21748 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21747 _keys!976) (size!21748 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22825 () Bool)

(declare-fun tp!44073 () Bool)

(assert (=> mapNonEmpty!22825 (= mapRes!22825 (and tp!44073 e!451080))))

(declare-fun mapKey!22825 () (_ BitVec 32))

(declare-fun mapRest!22825 () (Array (_ BitVec 32) ValueCell!6666))

(declare-fun mapValue!22825 () ValueCell!6666)

(assert (=> mapNonEmpty!22825 (= (arr!21327 _values!788) (store mapRest!22825 mapKey!22825 mapValue!22825))))

(declare-fun b!813915 () Bool)

(declare-fun res!555978 () Bool)

(assert (=> b!813915 (=> (not res!555978) (not e!451083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44532 (_ BitVec 32)) Bool)

(assert (=> b!813915 (= res!555978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813916 () Bool)

(assert (=> b!813916 (= e!451083 false)))

(declare-datatypes ((tuple2!9338 0))(
  ( (tuple2!9339 (_1!4680 (_ BitVec 64)) (_2!4680 V!23885)) )
))
(declare-datatypes ((List!15173 0))(
  ( (Nil!15170) (Cons!15169 (h!16298 tuple2!9338) (t!21490 List!15173)) )
))
(declare-datatypes ((ListLongMap!8161 0))(
  ( (ListLongMap!8162 (toList!4096 List!15173)) )
))
(declare-fun lt!364431 () ListLongMap!8161)

(declare-fun zeroValueAfter!34 () V!23885)

(declare-fun minValue!754 () V!23885)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2146 (array!44532 array!44534 (_ BitVec 32) (_ BitVec 32) V!23885 V!23885 (_ BitVec 32) Int) ListLongMap!8161)

(assert (=> b!813916 (= lt!364431 (getCurrentListMapNoExtraKeys!2146 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364430 () ListLongMap!8161)

(declare-fun zeroValueBefore!34 () V!23885)

(assert (=> b!813916 (= lt!364430 (getCurrentListMapNoExtraKeys!2146 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813917 () Bool)

(assert (=> b!813917 (= e!451082 (and e!451079 mapRes!22825))))

(declare-fun condMapEmpty!22825 () Bool)

(declare-fun mapDefault!22825 () ValueCell!6666)

(assert (=> b!813917 (= condMapEmpty!22825 (= (arr!21327 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6666)) mapDefault!22825)))))

(assert (= (and start!70032 res!555977) b!813914))

(assert (= (and b!813914 res!555975) b!813915))

(assert (= (and b!813915 res!555978) b!813912))

(assert (= (and b!813912 res!555976) b!813916))

(assert (= (and b!813917 condMapEmpty!22825) mapIsEmpty!22825))

(assert (= (and b!813917 (not condMapEmpty!22825)) mapNonEmpty!22825))

(get-info :version)

(assert (= (and mapNonEmpty!22825 ((_ is ValueCellFull!6666) mapValue!22825)) b!813911))

(assert (= (and b!813917 ((_ is ValueCellFull!6666) mapDefault!22825)) b!813913))

(assert (= start!70032 b!813917))

(declare-fun m!755829 () Bool)

(assert (=> b!813916 m!755829))

(declare-fun m!755831 () Bool)

(assert (=> b!813916 m!755831))

(declare-fun m!755833 () Bool)

(assert (=> start!70032 m!755833))

(declare-fun m!755835 () Bool)

(assert (=> start!70032 m!755835))

(declare-fun m!755837 () Bool)

(assert (=> start!70032 m!755837))

(declare-fun m!755839 () Bool)

(assert (=> mapNonEmpty!22825 m!755839))

(declare-fun m!755841 () Bool)

(assert (=> b!813915 m!755841))

(declare-fun m!755843 () Bool)

(assert (=> b!813912 m!755843))

(check-sat (not b!813916) b_and!21225 (not b!813915) (not b!813912) tp_is_empty!14163 (not b_next!12453) (not start!70032) (not mapNonEmpty!22825))
(check-sat b_and!21225 (not b_next!12453))
