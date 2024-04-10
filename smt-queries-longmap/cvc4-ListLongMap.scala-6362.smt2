; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81912 () Bool)

(assert start!81912)

(declare-fun b_free!18407 () Bool)

(declare-fun b_next!18407 () Bool)

(assert (=> start!81912 (= b_free!18407 (not b_next!18407))))

(declare-fun tp!63920 () Bool)

(declare-fun b_and!29893 () Bool)

(assert (=> start!81912 (= tp!63920 b_and!29893)))

(declare-fun b!955407 () Bool)

(declare-fun e!538243 () Bool)

(assert (=> b!955407 (= e!538243 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32917 0))(
  ( (V!32918 (val!10526 Int)) )
))
(declare-fun zeroValue!1139 () V!32917)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58007 0))(
  ( (array!58008 (arr!27883 (Array (_ BitVec 32) (_ BitVec 64))) (size!28362 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58007)

(declare-datatypes ((ValueCell!9994 0))(
  ( (ValueCellFull!9994 (v!13081 V!32917)) (EmptyCell!9994) )
))
(declare-datatypes ((array!58009 0))(
  ( (array!58010 (arr!27884 (Array (_ BitVec 32) ValueCell!9994)) (size!28363 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58009)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32917)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13658 0))(
  ( (tuple2!13659 (_1!6840 (_ BitVec 64)) (_2!6840 V!32917)) )
))
(declare-datatypes ((List!19433 0))(
  ( (Nil!19430) (Cons!19429 (h!20591 tuple2!13658) (t!27794 List!19433)) )
))
(declare-datatypes ((ListLongMap!12355 0))(
  ( (ListLongMap!12356 (toList!6193 List!19433)) )
))
(declare-fun contains!5291 (ListLongMap!12355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3426 (array!58007 array!58009 (_ BitVec 32) (_ BitVec 32) V!32917 V!32917 (_ BitVec 32) Int) ListLongMap!12355)

(assert (=> b!955407 (contains!5291 (getCurrentListMap!3426 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27883 _keys!1441) i!735))))

(declare-datatypes ((Unit!32107 0))(
  ( (Unit!32108) )
))
(declare-fun lt!430004 () Unit!32107)

(declare-fun lemmaInListMapFromThenFromZero!8 (array!58007 array!58009 (_ BitVec 32) (_ BitVec 32) V!32917 V!32917 (_ BitVec 32) (_ BitVec 32) Int) Unit!32107)

(assert (=> b!955407 (= lt!430004 (lemmaInListMapFromThenFromZero!8 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955408 () Bool)

(declare-fun res!639794 () Bool)

(assert (=> b!955408 (=> (not res!639794) (not e!538243))))

(assert (=> b!955408 (= res!639794 (contains!5291 (getCurrentListMap!3426 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27883 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33388 () Bool)

(declare-fun mapRes!33388 () Bool)

(declare-fun tp!63921 () Bool)

(declare-fun e!538241 () Bool)

(assert (=> mapNonEmpty!33388 (= mapRes!33388 (and tp!63921 e!538241))))

(declare-fun mapRest!33388 () (Array (_ BitVec 32) ValueCell!9994))

(declare-fun mapKey!33388 () (_ BitVec 32))

(declare-fun mapValue!33388 () ValueCell!9994)

(assert (=> mapNonEmpty!33388 (= (arr!27884 _values!1197) (store mapRest!33388 mapKey!33388 mapValue!33388))))

(declare-fun b!955409 () Bool)

(declare-fun res!639795 () Bool)

(assert (=> b!955409 (=> (not res!639795) (not e!538243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58007 (_ BitVec 32)) Bool)

(assert (=> b!955409 (= res!639795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955410 () Bool)

(declare-fun e!538240 () Bool)

(declare-fun tp_is_empty!20951 () Bool)

(assert (=> b!955410 (= e!538240 tp_is_empty!20951)))

(declare-fun res!639792 () Bool)

(assert (=> start!81912 (=> (not res!639792) (not e!538243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81912 (= res!639792 (validMask!0 mask!1823))))

(assert (=> start!81912 e!538243))

(assert (=> start!81912 true))

(assert (=> start!81912 tp_is_empty!20951))

(declare-fun array_inv!21641 (array!58007) Bool)

(assert (=> start!81912 (array_inv!21641 _keys!1441)))

(declare-fun e!538242 () Bool)

(declare-fun array_inv!21642 (array!58009) Bool)

(assert (=> start!81912 (and (array_inv!21642 _values!1197) e!538242)))

(assert (=> start!81912 tp!63920))

(declare-fun b!955411 () Bool)

(declare-fun res!639793 () Bool)

(assert (=> b!955411 (=> (not res!639793) (not e!538243))))

(assert (=> b!955411 (= res!639793 (and (= (size!28363 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28362 _keys!1441) (size!28363 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955412 () Bool)

(assert (=> b!955412 (= e!538242 (and e!538240 mapRes!33388))))

(declare-fun condMapEmpty!33388 () Bool)

(declare-fun mapDefault!33388 () ValueCell!9994)

