; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81822 () Bool)

(assert start!81822)

(declare-fun b_free!18317 () Bool)

(declare-fun b_next!18317 () Bool)

(assert (=> start!81822 (= b_free!18317 (not b_next!18317))))

(declare-fun tp!63651 () Bool)

(declare-fun b_and!29803 () Bool)

(assert (=> start!81822 (= tp!63651 b_and!29803)))

(declare-fun res!638951 () Bool)

(declare-fun e!537568 () Bool)

(assert (=> start!81822 (=> (not res!638951) (not e!537568))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81822 (= res!638951 (validMask!0 mask!1823))))

(assert (=> start!81822 e!537568))

(assert (=> start!81822 true))

(declare-fun tp_is_empty!20861 () Bool)

(assert (=> start!81822 tp_is_empty!20861))

(declare-datatypes ((array!57835 0))(
  ( (array!57836 (arr!27797 (Array (_ BitVec 32) (_ BitVec 64))) (size!28276 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57835)

(declare-fun array_inv!21579 (array!57835) Bool)

(assert (=> start!81822 (array_inv!21579 _keys!1441)))

(declare-datatypes ((V!32797 0))(
  ( (V!32798 (val!10481 Int)) )
))
(declare-datatypes ((ValueCell!9949 0))(
  ( (ValueCellFull!9949 (v!13036 V!32797)) (EmptyCell!9949) )
))
(declare-datatypes ((array!57837 0))(
  ( (array!57838 (arr!27798 (Array (_ BitVec 32) ValueCell!9949)) (size!28277 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57837)

(declare-fun e!537564 () Bool)

(declare-fun array_inv!21580 (array!57837) Bool)

(assert (=> start!81822 (and (array_inv!21580 _values!1197) e!537564)))

(assert (=> start!81822 tp!63651))

(declare-fun mapNonEmpty!33253 () Bool)

(declare-fun mapRes!33253 () Bool)

(declare-fun tp!63650 () Bool)

(declare-fun e!537567 () Bool)

(assert (=> mapNonEmpty!33253 (= mapRes!33253 (and tp!63650 e!537567))))

(declare-fun mapKey!33253 () (_ BitVec 32))

(declare-fun mapValue!33253 () ValueCell!9949)

(declare-fun mapRest!33253 () (Array (_ BitVec 32) ValueCell!9949))

(assert (=> mapNonEmpty!33253 (= (arr!27798 _values!1197) (store mapRest!33253 mapKey!33253 mapValue!33253))))

(declare-fun b!954157 () Bool)

(declare-fun res!638950 () Bool)

(assert (=> b!954157 (=> (not res!638950) (not e!537568))))

(declare-datatypes ((List!19385 0))(
  ( (Nil!19382) (Cons!19381 (h!20543 (_ BitVec 64)) (t!27746 List!19385)) )
))
(declare-fun arrayNoDuplicates!0 (array!57835 (_ BitVec 32) List!19385) Bool)

(assert (=> b!954157 (= res!638950 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19382))))

(declare-fun b!954158 () Bool)

(declare-fun res!638948 () Bool)

(assert (=> b!954158 (=> (not res!638948) (not e!537568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57835 (_ BitVec 32)) Bool)

(assert (=> b!954158 (= res!638948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954159 () Bool)

(declare-fun res!638952 () Bool)

(assert (=> b!954159 (=> (not res!638952) (not e!537568))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!954159 (= res!638952 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28276 _keys!1441))))))

(declare-fun b!954160 () Bool)

(declare-fun res!638949 () Bool)

(assert (=> b!954160 (=> (not res!638949) (not e!537568))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954160 (= res!638949 (and (= (size!28277 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28276 _keys!1441) (size!28277 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954161 () Bool)

(declare-fun res!638947 () Bool)

(assert (=> b!954161 (=> (not res!638947) (not e!537568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954161 (= res!638947 (validKeyInArray!0 (select (arr!27797 _keys!1441) i!735)))))

(declare-fun b!954162 () Bool)

(declare-fun e!537565 () Bool)

(assert (=> b!954162 (= e!537564 (and e!537565 mapRes!33253))))

(declare-fun condMapEmpty!33253 () Bool)

(declare-fun mapDefault!33253 () ValueCell!9949)

