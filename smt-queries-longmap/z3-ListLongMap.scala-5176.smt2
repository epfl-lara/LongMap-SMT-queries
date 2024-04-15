; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70022 () Bool)

(assert start!70022)

(declare-fun b_free!12463 () Bool)

(declare-fun b_next!12463 () Bool)

(assert (=> start!70022 (= b_free!12463 (not b_next!12463))))

(declare-fun tp!44103 () Bool)

(declare-fun b_and!21209 () Bool)

(assert (=> start!70022 (= tp!44103 b_and!21209)))

(declare-fun b!813770 () Bool)

(declare-fun res!555929 () Bool)

(declare-fun e!451005 () Bool)

(assert (=> b!813770 (=> (not res!555929) (not e!451005))))

(declare-datatypes ((array!44549 0))(
  ( (array!44550 (arr!21335 (Array (_ BitVec 32) (_ BitVec 64))) (size!21756 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44549)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44549 (_ BitVec 32)) Bool)

(assert (=> b!813770 (= res!555929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813771 () Bool)

(declare-fun e!451008 () Bool)

(declare-fun tp_is_empty!14173 () Bool)

(assert (=> b!813771 (= e!451008 tp_is_empty!14173)))

(declare-fun res!555932 () Bool)

(assert (=> start!70022 (=> (not res!555932) (not e!451005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70022 (= res!555932 (validMask!0 mask!1312))))

(assert (=> start!70022 e!451005))

(assert (=> start!70022 tp_is_empty!14173))

(declare-fun array_inv!17163 (array!44549) Bool)

(assert (=> start!70022 (array_inv!17163 _keys!976)))

(assert (=> start!70022 true))

(declare-datatypes ((V!23899 0))(
  ( (V!23900 (val!7134 Int)) )
))
(declare-datatypes ((ValueCell!6671 0))(
  ( (ValueCellFull!6671 (v!9555 V!23899)) (EmptyCell!6671) )
))
(declare-datatypes ((array!44551 0))(
  ( (array!44552 (arr!21336 (Array (_ BitVec 32) ValueCell!6671)) (size!21757 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44551)

(declare-fun e!451004 () Bool)

(declare-fun array_inv!17164 (array!44551) Bool)

(assert (=> start!70022 (and (array_inv!17164 _values!788) e!451004)))

(assert (=> start!70022 tp!44103))

(declare-fun b!813772 () Bool)

(declare-fun res!555931 () Bool)

(assert (=> b!813772 (=> (not res!555931) (not e!451005))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813772 (= res!555931 (and (= (size!21757 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21756 _keys!976) (size!21757 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813773 () Bool)

(declare-fun e!451007 () Bool)

(assert (=> b!813773 (= e!451007 tp_is_empty!14173)))

(declare-fun b!813774 () Bool)

(declare-fun mapRes!22840 () Bool)

(assert (=> b!813774 (= e!451004 (and e!451007 mapRes!22840))))

(declare-fun condMapEmpty!22840 () Bool)

(declare-fun mapDefault!22840 () ValueCell!6671)

(assert (=> b!813774 (= condMapEmpty!22840 (= (arr!21336 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6671)) mapDefault!22840)))))

(declare-fun b!813775 () Bool)

(declare-fun res!555930 () Bool)

(assert (=> b!813775 (=> (not res!555930) (not e!451005))))

(declare-datatypes ((List!15212 0))(
  ( (Nil!15209) (Cons!15208 (h!16337 (_ BitVec 64)) (t!21520 List!15212)) )
))
(declare-fun arrayNoDuplicates!0 (array!44549 (_ BitVec 32) List!15212) Bool)

(assert (=> b!813775 (= res!555930 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15209))))

(declare-fun mapNonEmpty!22840 () Bool)

(declare-fun tp!44104 () Bool)

(assert (=> mapNonEmpty!22840 (= mapRes!22840 (and tp!44104 e!451008))))

(declare-fun mapValue!22840 () ValueCell!6671)

(declare-fun mapKey!22840 () (_ BitVec 32))

(declare-fun mapRest!22840 () (Array (_ BitVec 32) ValueCell!6671))

(assert (=> mapNonEmpty!22840 (= (arr!21336 _values!788) (store mapRest!22840 mapKey!22840 mapValue!22840))))

(declare-fun b!813776 () Bool)

(assert (=> b!813776 (= e!451005 false)))

(declare-fun zeroValueAfter!34 () V!23899)

(declare-fun minValue!754 () V!23899)

(declare-datatypes ((tuple2!9386 0))(
  ( (tuple2!9387 (_1!4704 (_ BitVec 64)) (_2!4704 V!23899)) )
))
(declare-datatypes ((List!15213 0))(
  ( (Nil!15210) (Cons!15209 (h!16338 tuple2!9386) (t!21521 List!15213)) )
))
(declare-datatypes ((ListLongMap!8199 0))(
  ( (ListLongMap!8200 (toList!4115 List!15213)) )
))
(declare-fun lt!364218 () ListLongMap!8199)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2180 (array!44549 array!44551 (_ BitVec 32) (_ BitVec 32) V!23899 V!23899 (_ BitVec 32) Int) ListLongMap!8199)

(assert (=> b!813776 (= lt!364218 (getCurrentListMapNoExtraKeys!2180 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23899)

(declare-fun lt!364217 () ListLongMap!8199)

(assert (=> b!813776 (= lt!364217 (getCurrentListMapNoExtraKeys!2180 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22840 () Bool)

(assert (=> mapIsEmpty!22840 mapRes!22840))

(assert (= (and start!70022 res!555932) b!813772))

(assert (= (and b!813772 res!555931) b!813770))

(assert (= (and b!813770 res!555929) b!813775))

(assert (= (and b!813775 res!555930) b!813776))

(assert (= (and b!813774 condMapEmpty!22840) mapIsEmpty!22840))

(assert (= (and b!813774 (not condMapEmpty!22840)) mapNonEmpty!22840))

(get-info :version)

(assert (= (and mapNonEmpty!22840 ((_ is ValueCellFull!6671) mapValue!22840)) b!813771))

(assert (= (and b!813774 ((_ is ValueCellFull!6671) mapDefault!22840)) b!813773))

(assert (= start!70022 b!813774))

(declare-fun m!755157 () Bool)

(assert (=> b!813776 m!755157))

(declare-fun m!755159 () Bool)

(assert (=> b!813776 m!755159))

(declare-fun m!755161 () Bool)

(assert (=> start!70022 m!755161))

(declare-fun m!755163 () Bool)

(assert (=> start!70022 m!755163))

(declare-fun m!755165 () Bool)

(assert (=> start!70022 m!755165))

(declare-fun m!755167 () Bool)

(assert (=> mapNonEmpty!22840 m!755167))

(declare-fun m!755169 () Bool)

(assert (=> b!813770 m!755169))

(declare-fun m!755171 () Bool)

(assert (=> b!813775 m!755171))

(check-sat (not b_next!12463) (not start!70022) (not b!813776) b_and!21209 tp_is_empty!14173 (not b!813775) (not b!813770) (not mapNonEmpty!22840))
(check-sat b_and!21209 (not b_next!12463))
