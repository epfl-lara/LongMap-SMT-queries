; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105036 () Bool)

(assert start!105036)

(declare-fun b_free!26783 () Bool)

(declare-fun b_next!26783 () Bool)

(assert (=> start!105036 (= b_free!26783 (not b_next!26783))))

(declare-fun tp!93847 () Bool)

(declare-fun b_and!44579 () Bool)

(assert (=> start!105036 (= tp!93847 b_and!44579)))

(declare-fun b!1251843 () Bool)

(declare-fun e!710916 () Bool)

(declare-fun tp_is_empty!31685 () Bool)

(assert (=> b!1251843 (= e!710916 tp_is_empty!31685)))

(declare-fun res!834907 () Bool)

(declare-fun e!710918 () Bool)

(assert (=> start!105036 (=> (not res!834907) (not e!710918))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105036 (= res!834907 (validMask!0 mask!1466))))

(assert (=> start!105036 e!710918))

(assert (=> start!105036 true))

(assert (=> start!105036 tp!93847))

(assert (=> start!105036 tp_is_empty!31685))

(declare-datatypes ((array!81036 0))(
  ( (array!81037 (arr!39082 (Array (_ BitVec 32) (_ BitVec 64))) (size!39618 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81036)

(declare-fun array_inv!29811 (array!81036) Bool)

(assert (=> start!105036 (array_inv!29811 _keys!1118)))

(declare-datatypes ((V!47611 0))(
  ( (V!47612 (val!15905 Int)) )
))
(declare-datatypes ((ValueCell!15079 0))(
  ( (ValueCellFull!15079 (v!18603 V!47611)) (EmptyCell!15079) )
))
(declare-datatypes ((array!81038 0))(
  ( (array!81039 (arr!39083 (Array (_ BitVec 32) ValueCell!15079)) (size!39619 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81038)

(declare-fun e!710919 () Bool)

(declare-fun array_inv!29812 (array!81038) Bool)

(assert (=> start!105036 (and (array_inv!29812 _values!914) e!710919)))

(declare-fun b!1251844 () Bool)

(declare-fun res!834909 () Bool)

(assert (=> b!1251844 (=> (not res!834909) (not e!710918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81036 (_ BitVec 32)) Bool)

(assert (=> b!1251844 (= res!834909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251845 () Bool)

(declare-fun e!710917 () Bool)

(assert (=> b!1251845 (= e!710917 tp_is_empty!31685)))

(declare-fun b!1251846 () Bool)

(declare-fun res!834908 () Bool)

(assert (=> b!1251846 (=> (not res!834908) (not e!710918))))

(declare-datatypes ((List!27743 0))(
  ( (Nil!27740) (Cons!27739 (h!28948 (_ BitVec 64)) (t!41220 List!27743)) )
))
(declare-fun arrayNoDuplicates!0 (array!81036 (_ BitVec 32) List!27743) Bool)

(assert (=> b!1251846 (= res!834908 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27740))))

(declare-fun mapNonEmpty!49297 () Bool)

(declare-fun mapRes!49297 () Bool)

(declare-fun tp!93848 () Bool)

(assert (=> mapNonEmpty!49297 (= mapRes!49297 (and tp!93848 e!710917))))

(declare-fun mapValue!49297 () ValueCell!15079)

(declare-fun mapRest!49297 () (Array (_ BitVec 32) ValueCell!15079))

(declare-fun mapKey!49297 () (_ BitVec 32))

(assert (=> mapNonEmpty!49297 (= (arr!39083 _values!914) (store mapRest!49297 mapKey!49297 mapValue!49297))))

(declare-fun mapIsEmpty!49297 () Bool)

(assert (=> mapIsEmpty!49297 mapRes!49297))

(declare-fun b!1251847 () Bool)

(assert (=> b!1251847 (= e!710919 (and e!710916 mapRes!49297))))

(declare-fun condMapEmpty!49297 () Bool)

(declare-fun mapDefault!49297 () ValueCell!15079)

