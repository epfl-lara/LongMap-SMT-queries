; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42000 () Bool)

(assert start!42000)

(declare-fun b_free!11573 () Bool)

(declare-fun b_next!11573 () Bool)

(assert (=> start!42000 (= b_free!11573 (not b_next!11573))))

(declare-fun tp!40735 () Bool)

(declare-fun b_and!19971 () Bool)

(assert (=> start!42000 (= tp!40735 b_and!19971)))

(declare-fun b!468930 () Bool)

(declare-fun res!280240 () Bool)

(declare-fun e!274520 () Bool)

(assert (=> b!468930 (=> (not res!280240) (not e!274520))))

(declare-datatypes ((array!29775 0))(
  ( (array!29776 (arr!14313 (Array (_ BitVec 32) (_ BitVec 64))) (size!14665 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29775)

(declare-datatypes ((List!8690 0))(
  ( (Nil!8687) (Cons!8686 (h!9542 (_ BitVec 64)) (t!14648 List!8690)) )
))
(declare-fun arrayNoDuplicates!0 (array!29775 (_ BitVec 32) List!8690) Bool)

(assert (=> b!468930 (= res!280240 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8687))))

(declare-fun b!468931 () Bool)

(declare-fun res!280244 () Bool)

(assert (=> b!468931 (=> (not res!280244) (not e!274520))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18439 0))(
  ( (V!18440 (val!6545 Int)) )
))
(declare-datatypes ((ValueCell!6157 0))(
  ( (ValueCellFull!6157 (v!8834 V!18439)) (EmptyCell!6157) )
))
(declare-datatypes ((array!29777 0))(
  ( (array!29778 (arr!14314 (Array (_ BitVec 32) ValueCell!6157)) (size!14666 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29777)

(assert (=> b!468931 (= res!280244 (and (= (size!14666 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14665 _keys!1025) (size!14666 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468932 () Bool)

(declare-fun e!274523 () Bool)

(assert (=> b!468932 (= e!274523 true)))

(declare-datatypes ((tuple2!8606 0))(
  ( (tuple2!8607 (_1!4314 (_ BitVec 64)) (_2!4314 V!18439)) )
))
(declare-datatypes ((List!8691 0))(
  ( (Nil!8688) (Cons!8687 (h!9543 tuple2!8606) (t!14649 List!8691)) )
))
(declare-datatypes ((ListLongMap!7519 0))(
  ( (ListLongMap!7520 (toList!3775 List!8691)) )
))
(declare-fun lt!212272 () ListLongMap!7519)

(declare-fun lt!212271 () tuple2!8606)

(declare-fun minValueBefore!38 () V!18439)

(declare-fun +!1686 (ListLongMap!7519 tuple2!8606) ListLongMap!7519)

(assert (=> b!468932 (= (+!1686 lt!212272 lt!212271) (+!1686 (+!1686 lt!212272 (tuple2!8607 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212271))))

(declare-fun minValueAfter!38 () V!18439)

(assert (=> b!468932 (= lt!212271 (tuple2!8607 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13705 0))(
  ( (Unit!13706) )
))
(declare-fun lt!212273 () Unit!13705)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!99 (ListLongMap!7519 (_ BitVec 64) V!18439 V!18439) Unit!13705)

(assert (=> b!468932 (= lt!212273 (addSameAsAddTwiceSameKeyDiffValues!99 lt!212272 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18439)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212270 () ListLongMap!7519)

(declare-fun getCurrentListMap!2200 (array!29775 array!29777 (_ BitVec 32) (_ BitVec 32) V!18439 V!18439 (_ BitVec 32) Int) ListLongMap!7519)

(assert (=> b!468932 (= lt!212270 (getCurrentListMap!2200 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212274 () ListLongMap!7519)

(assert (=> b!468932 (= lt!212274 (getCurrentListMap!2200 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468934 () Bool)

(declare-fun e!274519 () Bool)

(declare-fun tp_is_empty!13001 () Bool)

(assert (=> b!468934 (= e!274519 tp_is_empty!13001)))

(declare-fun b!468935 () Bool)

(declare-fun res!280241 () Bool)

(assert (=> b!468935 (=> (not res!280241) (not e!274520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29775 (_ BitVec 32)) Bool)

(assert (=> b!468935 (= res!280241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21196 () Bool)

(declare-fun mapRes!21196 () Bool)

(assert (=> mapIsEmpty!21196 mapRes!21196))

(declare-fun res!280242 () Bool)

(assert (=> start!42000 (=> (not res!280242) (not e!274520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42000 (= res!280242 (validMask!0 mask!1365))))

(assert (=> start!42000 e!274520))

(assert (=> start!42000 tp_is_empty!13001))

(assert (=> start!42000 tp!40735))

(assert (=> start!42000 true))

(declare-fun array_inv!10330 (array!29775) Bool)

(assert (=> start!42000 (array_inv!10330 _keys!1025)))

(declare-fun e!274521 () Bool)

(declare-fun array_inv!10331 (array!29777) Bool)

(assert (=> start!42000 (and (array_inv!10331 _values!833) e!274521)))

(declare-fun b!468933 () Bool)

(assert (=> b!468933 (= e!274521 (and e!274519 mapRes!21196))))

(declare-fun condMapEmpty!21196 () Bool)

(declare-fun mapDefault!21196 () ValueCell!6157)

