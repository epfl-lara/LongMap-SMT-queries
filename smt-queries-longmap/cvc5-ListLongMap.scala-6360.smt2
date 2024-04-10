; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81896 () Bool)

(assert start!81896)

(declare-fun b_free!18391 () Bool)

(declare-fun b_next!18391 () Bool)

(assert (=> start!81896 (= b_free!18391 (not b_next!18391))))

(declare-fun tp!63873 () Bool)

(declare-fun b_and!29877 () Bool)

(assert (=> start!81896 (= tp!63873 b_and!29877)))

(declare-fun b!955167 () Bool)

(declare-fun res!639627 () Bool)

(declare-fun e!538122 () Bool)

(assert (=> b!955167 (=> (not res!639627) (not e!538122))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57975 0))(
  ( (array!57976 (arr!27867 (Array (_ BitVec 32) (_ BitVec 64))) (size!28346 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57975)

(declare-datatypes ((V!32897 0))(
  ( (V!32898 (val!10518 Int)) )
))
(declare-datatypes ((ValueCell!9986 0))(
  ( (ValueCellFull!9986 (v!13073 V!32897)) (EmptyCell!9986) )
))
(declare-datatypes ((array!57977 0))(
  ( (array!57978 (arr!27868 (Array (_ BitVec 32) ValueCell!9986)) (size!28347 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57977)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955167 (= res!639627 (and (= (size!28347 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28346 _keys!1441) (size!28347 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955168 () Bool)

(declare-fun res!639628 () Bool)

(assert (=> b!955168 (=> (not res!639628) (not e!538122))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955168 (= res!639628 (validKeyInArray!0 (select (arr!27867 _keys!1441) i!735)))))

(declare-fun b!955169 () Bool)

(declare-fun res!639629 () Bool)

(assert (=> b!955169 (=> (not res!639629) (not e!538122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57975 (_ BitVec 32)) Bool)

(assert (=> b!955169 (= res!639629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955170 () Bool)

(declare-fun res!639626 () Bool)

(assert (=> b!955170 (=> (not res!639626) (not e!538122))))

(declare-fun zeroValue!1139 () V!32897)

(declare-fun minValue!1139 () V!32897)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13646 0))(
  ( (tuple2!13647 (_1!6834 (_ BitVec 64)) (_2!6834 V!32897)) )
))
(declare-datatypes ((List!19422 0))(
  ( (Nil!19419) (Cons!19418 (h!20580 tuple2!13646) (t!27783 List!19422)) )
))
(declare-datatypes ((ListLongMap!12343 0))(
  ( (ListLongMap!12344 (toList!6187 List!19422)) )
))
(declare-fun contains!5285 (ListLongMap!12343 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3420 (array!57975 array!57977 (_ BitVec 32) (_ BitVec 32) V!32897 V!32897 (_ BitVec 32) Int) ListLongMap!12343)

(assert (=> b!955170 (= res!639626 (contains!5285 (getCurrentListMap!3420 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27867 _keys!1441) i!735)))))

(declare-fun b!955171 () Bool)

(declare-fun res!639630 () Bool)

(assert (=> b!955171 (=> (not res!639630) (not e!538122))))

(assert (=> b!955171 (= res!639630 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28346 _keys!1441))))))

(declare-fun b!955172 () Bool)

(assert (=> b!955172 (= e!538122 (not true))))

(assert (=> b!955172 (contains!5285 (getCurrentListMap!3420 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27867 _keys!1441) i!735))))

(declare-datatypes ((Unit!32095 0))(
  ( (Unit!32096) )
))
(declare-fun lt!429980 () Unit!32095)

(declare-fun lemmaInListMapFromThenFromZero!2 (array!57975 array!57977 (_ BitVec 32) (_ BitVec 32) V!32897 V!32897 (_ BitVec 32) (_ BitVec 32) Int) Unit!32095)

(assert (=> b!955172 (= lt!429980 (lemmaInListMapFromThenFromZero!2 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955173 () Bool)

(declare-fun res!639624 () Bool)

(assert (=> b!955173 (=> (not res!639624) (not e!538122))))

(declare-datatypes ((List!19423 0))(
  ( (Nil!19420) (Cons!19419 (h!20581 (_ BitVec 64)) (t!27784 List!19423)) )
))
(declare-fun arrayNoDuplicates!0 (array!57975 (_ BitVec 32) List!19423) Bool)

(assert (=> b!955173 (= res!639624 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19420))))

(declare-fun mapNonEmpty!33364 () Bool)

(declare-fun mapRes!33364 () Bool)

(declare-fun tp!63872 () Bool)

(declare-fun e!538123 () Bool)

(assert (=> mapNonEmpty!33364 (= mapRes!33364 (and tp!63872 e!538123))))

(declare-fun mapKey!33364 () (_ BitVec 32))

(declare-fun mapRest!33364 () (Array (_ BitVec 32) ValueCell!9986))

(declare-fun mapValue!33364 () ValueCell!9986)

(assert (=> mapNonEmpty!33364 (= (arr!27868 _values!1197) (store mapRest!33364 mapKey!33364 mapValue!33364))))

(declare-fun b!955174 () Bool)

(declare-fun tp_is_empty!20935 () Bool)

(assert (=> b!955174 (= e!538123 tp_is_empty!20935)))

(declare-fun res!639625 () Bool)

(assert (=> start!81896 (=> (not res!639625) (not e!538122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81896 (= res!639625 (validMask!0 mask!1823))))

(assert (=> start!81896 e!538122))

(assert (=> start!81896 true))

(assert (=> start!81896 tp_is_empty!20935))

(declare-fun array_inv!21627 (array!57975) Bool)

(assert (=> start!81896 (array_inv!21627 _keys!1441)))

(declare-fun e!538120 () Bool)

(declare-fun array_inv!21628 (array!57977) Bool)

(assert (=> start!81896 (and (array_inv!21628 _values!1197) e!538120)))

(assert (=> start!81896 tp!63873))

(declare-fun mapIsEmpty!33364 () Bool)

(assert (=> mapIsEmpty!33364 mapRes!33364))

(declare-fun b!955175 () Bool)

(declare-fun e!538119 () Bool)

(assert (=> b!955175 (= e!538119 tp_is_empty!20935)))

(declare-fun b!955176 () Bool)

(assert (=> b!955176 (= e!538120 (and e!538119 mapRes!33364))))

(declare-fun condMapEmpty!33364 () Bool)

(declare-fun mapDefault!33364 () ValueCell!9986)

