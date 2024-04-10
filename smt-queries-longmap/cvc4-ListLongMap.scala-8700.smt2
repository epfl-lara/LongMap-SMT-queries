; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105638 () Bool)

(assert start!105638)

(declare-fun b_free!27239 () Bool)

(declare-fun b_next!27239 () Bool)

(assert (=> start!105638 (= b_free!27239 (not b_next!27239))))

(declare-fun tp!95239 () Bool)

(declare-fun b_and!45113 () Bool)

(assert (=> start!105638 (= tp!95239 b_and!45113)))

(declare-fun b!1258345 () Bool)

(declare-fun e!715666 () Bool)

(assert (=> b!1258345 (= e!715666 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48219 0))(
  ( (V!48220 (val!16133 Int)) )
))
(declare-datatypes ((tuple2!20840 0))(
  ( (tuple2!20841 (_1!10431 (_ BitVec 64)) (_2!10431 V!48219)) )
))
(declare-datatypes ((List!28056 0))(
  ( (Nil!28053) (Cons!28052 (h!29261 tuple2!20840) (t!41549 List!28056)) )
))
(declare-datatypes ((ListLongMap!18713 0))(
  ( (ListLongMap!18714 (toList!9372 List!28056)) )
))
(declare-fun lt!569155 () ListLongMap!18713)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48219)

(declare-datatypes ((array!81906 0))(
  ( (array!81907 (arr!39509 (Array (_ BitVec 32) (_ BitVec 64))) (size!40045 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81906)

(declare-datatypes ((ValueCell!15307 0))(
  ( (ValueCellFull!15307 (v!18835 V!48219)) (EmptyCell!15307) )
))
(declare-datatypes ((array!81908 0))(
  ( (array!81909 (arr!39510 (Array (_ BitVec 32) ValueCell!15307)) (size!40046 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81908)

(declare-fun minValueBefore!43 () V!48219)

(declare-fun getCurrentListMap!4577 (array!81906 array!81908 (_ BitVec 32) (_ BitVec 32) V!48219 V!48219 (_ BitVec 32) Int) ListLongMap!18713)

(assert (=> b!1258345 (= lt!569155 (getCurrentListMap!4577 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258346 () Bool)

(declare-fun e!715667 () Bool)

(declare-fun e!715663 () Bool)

(declare-fun mapRes!50005 () Bool)

(assert (=> b!1258346 (= e!715667 (and e!715663 mapRes!50005))))

(declare-fun condMapEmpty!50005 () Bool)

(declare-fun mapDefault!50005 () ValueCell!15307)

