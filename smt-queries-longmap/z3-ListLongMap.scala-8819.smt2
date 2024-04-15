; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107138 () Bool)

(assert start!107138)

(declare-fun b_free!27643 () Bool)

(declare-fun b_next!27643 () Bool)

(assert (=> start!107138 (= b_free!27643 (not b_next!27643))))

(declare-fun tp!97157 () Bool)

(declare-fun b_and!45657 () Bool)

(assert (=> start!107138 (= tp!97157 b_and!45657)))

(declare-fun mapIsEmpty!50821 () Bool)

(declare-fun mapRes!50821 () Bool)

(assert (=> mapIsEmpty!50821 mapRes!50821))

(declare-fun b!1270187 () Bool)

(declare-fun e!724006 () Bool)

(declare-fun e!724009 () Bool)

(assert (=> b!1270187 (= e!724006 (and e!724009 mapRes!50821))))

(declare-fun condMapEmpty!50821 () Bool)

(declare-datatypes ((V!48963 0))(
  ( (V!48964 (val!16488 Int)) )
))
(declare-datatypes ((ValueCell!15560 0))(
  ( (ValueCellFull!15560 (v!19124 V!48963)) (EmptyCell!15560) )
))
(declare-datatypes ((array!82827 0))(
  ( (array!82828 (arr!39951 (Array (_ BitVec 32) ValueCell!15560)) (size!40489 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82827)

(declare-fun mapDefault!50821 () ValueCell!15560)

(assert (=> b!1270187 (= condMapEmpty!50821 (= (arr!39951 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15560)) mapDefault!50821)))))

(declare-fun res!845287 () Bool)

(declare-fun e!724008 () Bool)

(assert (=> start!107138 (=> (not res!845287) (not e!724008))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107138 (= res!845287 (validMask!0 mask!1730))))

(assert (=> start!107138 e!724008))

(declare-fun array_inv!30553 (array!82827) Bool)

(assert (=> start!107138 (and (array_inv!30553 _values!1134) e!724006)))

(assert (=> start!107138 true))

(declare-datatypes ((array!82829 0))(
  ( (array!82830 (arr!39952 (Array (_ BitVec 32) (_ BitVec 64))) (size!40490 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82829)

(declare-fun array_inv!30554 (array!82829) Bool)

(assert (=> start!107138 (array_inv!30554 _keys!1364)))

(declare-fun tp_is_empty!32827 () Bool)

(assert (=> start!107138 tp_is_empty!32827))

(assert (=> start!107138 tp!97157))

(declare-fun b!1270188 () Bool)

(declare-fun res!845285 () Bool)

(assert (=> b!1270188 (=> (not res!845285) (not e!724008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82829 (_ BitVec 32)) Bool)

(assert (=> b!1270188 (= res!845285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270189 () Bool)

(declare-fun res!845286 () Bool)

(assert (=> b!1270189 (=> (not res!845286) (not e!724008))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1270189 (= res!845286 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40490 _keys!1364)) (bvslt from!1698 (size!40490 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270190 () Bool)

(declare-fun res!845288 () Bool)

(assert (=> b!1270190 (=> (not res!845288) (not e!724008))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270190 (= res!845288 (and (= (size!40489 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40490 _keys!1364) (size!40489 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270191 () Bool)

(declare-fun e!724007 () Bool)

(assert (=> b!1270191 (= e!724007 tp_is_empty!32827)))

(declare-fun mapNonEmpty!50821 () Bool)

(declare-fun tp!97156 () Bool)

(assert (=> mapNonEmpty!50821 (= mapRes!50821 (and tp!97156 e!724007))))

(declare-fun mapValue!50821 () ValueCell!15560)

(declare-fun mapRest!50821 () (Array (_ BitVec 32) ValueCell!15560))

(declare-fun mapKey!50821 () (_ BitVec 32))

(assert (=> mapNonEmpty!50821 (= (arr!39951 _values!1134) (store mapRest!50821 mapKey!50821 mapValue!50821))))

(declare-fun b!1270192 () Bool)

(declare-fun res!845284 () Bool)

(assert (=> b!1270192 (=> (not res!845284) (not e!724008))))

(declare-datatypes ((List!28553 0))(
  ( (Nil!28550) (Cons!28549 (h!29758 (_ BitVec 64)) (t!42074 List!28553)) )
))
(declare-fun arrayNoDuplicates!0 (array!82829 (_ BitVec 32) List!28553) Bool)

(assert (=> b!1270192 (= res!845284 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28550))))

(declare-fun b!1270193 () Bool)

(assert (=> b!1270193 (= e!724008 (not true))))

(declare-fun minValueAfter!52 () V!48963)

(declare-fun minValueBefore!52 () V!48963)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48963)

(declare-fun zeroValueBefore!52 () V!48963)

(declare-datatypes ((tuple2!21438 0))(
  ( (tuple2!21439 (_1!10730 (_ BitVec 64)) (_2!10730 V!48963)) )
))
(declare-datatypes ((List!28554 0))(
  ( (Nil!28551) (Cons!28550 (h!29759 tuple2!21438) (t!42075 List!28554)) )
))
(declare-datatypes ((ListLongMap!19167 0))(
  ( (ListLongMap!19168 (toList!9599 List!28554)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5932 (array!82829 array!82827 (_ BitVec 32) (_ BitVec 32) V!48963 V!48963 (_ BitVec 32) Int) ListLongMap!19167)

(assert (=> b!1270193 (= (getCurrentListMapNoExtraKeys!5932 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5932 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42152 0))(
  ( (Unit!42153) )
))
(declare-fun lt!574499 () Unit!42152)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1232 (array!82829 array!82827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48963 V!48963 V!48963 V!48963 (_ BitVec 32) Int) Unit!42152)

(assert (=> b!1270193 (= lt!574499 (lemmaNoChangeToArrayThenSameMapNoExtras!1232 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270194 () Bool)

(assert (=> b!1270194 (= e!724009 tp_is_empty!32827)))

(assert (= (and start!107138 res!845287) b!1270190))

(assert (= (and b!1270190 res!845288) b!1270188))

(assert (= (and b!1270188 res!845285) b!1270192))

(assert (= (and b!1270192 res!845284) b!1270189))

(assert (= (and b!1270189 res!845286) b!1270193))

(assert (= (and b!1270187 condMapEmpty!50821) mapIsEmpty!50821))

(assert (= (and b!1270187 (not condMapEmpty!50821)) mapNonEmpty!50821))

(get-info :version)

(assert (= (and mapNonEmpty!50821 ((_ is ValueCellFull!15560) mapValue!50821)) b!1270191))

(assert (= (and b!1270187 ((_ is ValueCellFull!15560) mapDefault!50821)) b!1270194))

(assert (= start!107138 b!1270187))

(declare-fun m!1168089 () Bool)

(assert (=> b!1270192 m!1168089))

(declare-fun m!1168091 () Bool)

(assert (=> b!1270193 m!1168091))

(declare-fun m!1168093 () Bool)

(assert (=> b!1270193 m!1168093))

(declare-fun m!1168095 () Bool)

(assert (=> b!1270193 m!1168095))

(declare-fun m!1168097 () Bool)

(assert (=> start!107138 m!1168097))

(declare-fun m!1168099 () Bool)

(assert (=> start!107138 m!1168099))

(declare-fun m!1168101 () Bool)

(assert (=> start!107138 m!1168101))

(declare-fun m!1168103 () Bool)

(assert (=> b!1270188 m!1168103))

(declare-fun m!1168105 () Bool)

(assert (=> mapNonEmpty!50821 m!1168105))

(check-sat (not b!1270192) (not mapNonEmpty!50821) (not b!1270188) (not start!107138) (not b_next!27643) tp_is_empty!32827 (not b!1270193) b_and!45657)
(check-sat b_and!45657 (not b_next!27643))
