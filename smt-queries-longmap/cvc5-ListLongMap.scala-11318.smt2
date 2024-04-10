; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131812 () Bool)

(assert start!131812)

(declare-fun mapIsEmpty!58405 () Bool)

(declare-fun mapRes!58405 () Bool)

(assert (=> mapIsEmpty!58405 mapRes!58405))

(declare-fun b!1543263 () Bool)

(declare-fun res!1058907 () Bool)

(declare-fun e!858817 () Bool)

(assert (=> b!1543263 (=> (not res!1058907) (not e!858817))))

(declare-datatypes ((array!102828 0))(
  ( (array!102829 (arr!49616 (Array (_ BitVec 32) (_ BitVec 64))) (size!50166 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102828)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58845 0))(
  ( (V!58846 (val!18978 Int)) )
))
(declare-datatypes ((ValueCell!17990 0))(
  ( (ValueCellFull!17990 (v!21779 V!58845)) (EmptyCell!17990) )
))
(declare-datatypes ((array!102830 0))(
  ( (array!102831 (arr!49617 (Array (_ BitVec 32) ValueCell!17990)) (size!50167 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102830)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543263 (= res!1058907 (and (= (size!50167 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50166 _keys!618) (size!50167 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543264 () Bool)

(declare-fun res!1058905 () Bool)

(assert (=> b!1543264 (=> (not res!1058905) (not e!858817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102828 (_ BitVec 32)) Bool)

(assert (=> b!1543264 (= res!1058905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58405 () Bool)

(declare-fun tp!110932 () Bool)

(declare-fun e!858818 () Bool)

(assert (=> mapNonEmpty!58405 (= mapRes!58405 (and tp!110932 e!858818))))

(declare-fun mapRest!58405 () (Array (_ BitVec 32) ValueCell!17990))

(declare-fun mapKey!58405 () (_ BitVec 32))

(declare-fun mapValue!58405 () ValueCell!17990)

(assert (=> mapNonEmpty!58405 (= (arr!49617 _values!470) (store mapRest!58405 mapKey!58405 mapValue!58405))))

(declare-fun b!1543266 () Bool)

(declare-fun e!858819 () Bool)

(declare-fun tp_is_empty!37801 () Bool)

(assert (=> b!1543266 (= e!858819 tp_is_empty!37801)))

(declare-fun b!1543267 () Bool)

(assert (=> b!1543267 (= e!858817 false)))

(declare-fun lt!665954 () Bool)

(declare-datatypes ((List!35914 0))(
  ( (Nil!35911) (Cons!35910 (h!37355 (_ BitVec 64)) (t!50608 List!35914)) )
))
(declare-fun arrayNoDuplicates!0 (array!102828 (_ BitVec 32) List!35914) Bool)

(assert (=> b!1543267 (= lt!665954 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35911))))

(declare-fun b!1543268 () Bool)

(assert (=> b!1543268 (= e!858818 tp_is_empty!37801)))

(declare-fun res!1058906 () Bool)

(assert (=> start!131812 (=> (not res!1058906) (not e!858817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131812 (= res!1058906 (validMask!0 mask!926))))

(assert (=> start!131812 e!858817))

(assert (=> start!131812 true))

(declare-fun e!858815 () Bool)

(declare-fun array_inv!38601 (array!102830) Bool)

(assert (=> start!131812 (and (array_inv!38601 _values!470) e!858815)))

(declare-fun array_inv!38602 (array!102828) Bool)

(assert (=> start!131812 (array_inv!38602 _keys!618)))

(declare-fun b!1543265 () Bool)

(assert (=> b!1543265 (= e!858815 (and e!858819 mapRes!58405))))

(declare-fun condMapEmpty!58405 () Bool)

(declare-fun mapDefault!58405 () ValueCell!17990)

