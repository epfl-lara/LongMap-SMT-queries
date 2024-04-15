; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110470 () Bool)

(assert start!110470)

(declare-fun b!1306770 () Bool)

(declare-fun e!745618 () Bool)

(declare-fun e!745617 () Bool)

(declare-fun mapRes!54181 () Bool)

(assert (=> b!1306770 (= e!745618 (and e!745617 mapRes!54181))))

(declare-fun condMapEmpty!54181 () Bool)

(declare-datatypes ((V!51817 0))(
  ( (V!51818 (val!17592 Int)) )
))
(declare-datatypes ((ValueCell!16619 0))(
  ( (ValueCellFull!16619 (v!20218 V!51817)) (EmptyCell!16619) )
))
(declare-datatypes ((array!86989 0))(
  ( (array!86990 (arr!41975 (Array (_ BitVec 32) ValueCell!16619)) (size!42527 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86989)

(declare-fun mapDefault!54181 () ValueCell!16619)

(assert (=> b!1306770 (= condMapEmpty!54181 (= (arr!41975 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16619)) mapDefault!54181)))))

(declare-fun mapIsEmpty!54181 () Bool)

(assert (=> mapIsEmpty!54181 mapRes!54181))

(declare-fun b!1306771 () Bool)

(declare-fun tp_is_empty!35035 () Bool)

(assert (=> b!1306771 (= e!745617 tp_is_empty!35035)))

(declare-fun mapNonEmpty!54181 () Bool)

(declare-fun tp!103262 () Bool)

(declare-fun e!745619 () Bool)

(assert (=> mapNonEmpty!54181 (= mapRes!54181 (and tp!103262 e!745619))))

(declare-fun mapValue!54181 () ValueCell!16619)

(declare-fun mapRest!54181 () (Array (_ BitVec 32) ValueCell!16619))

(declare-fun mapKey!54181 () (_ BitVec 32))

(assert (=> mapNonEmpty!54181 (= (arr!41975 _values!1354) (store mapRest!54181 mapKey!54181 mapValue!54181))))

(declare-fun res!867482 () Bool)

(declare-fun e!745615 () Bool)

(assert (=> start!110470 (=> (not res!867482) (not e!745615))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110470 (= res!867482 (validMask!0 mask!2040))))

(assert (=> start!110470 e!745615))

(assert (=> start!110470 true))

(declare-fun array_inv!31923 (array!86989) Bool)

(assert (=> start!110470 (and (array_inv!31923 _values!1354) e!745618)))

(declare-datatypes ((array!86991 0))(
  ( (array!86992 (arr!41976 (Array (_ BitVec 32) (_ BitVec 64))) (size!42528 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86991)

(declare-fun array_inv!31924 (array!86991) Bool)

(assert (=> start!110470 (array_inv!31924 _keys!1628)))

(declare-fun b!1306772 () Bool)

(assert (=> b!1306772 (= e!745615 false)))

(declare-fun lt!584799 () Bool)

(declare-datatypes ((List!29851 0))(
  ( (Nil!29848) (Cons!29847 (h!31056 (_ BitVec 64)) (t!43449 List!29851)) )
))
(declare-fun arrayNoDuplicates!0 (array!86991 (_ BitVec 32) List!29851) Bool)

(assert (=> b!1306772 (= lt!584799 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29848))))

(declare-fun b!1306773 () Bool)

(declare-fun res!867484 () Bool)

(assert (=> b!1306773 (=> (not res!867484) (not e!745615))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306773 (= res!867484 (and (= (size!42527 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42528 _keys!1628) (size!42527 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306774 () Bool)

(assert (=> b!1306774 (= e!745619 tp_is_empty!35035)))

(declare-fun b!1306775 () Bool)

(declare-fun res!867483 () Bool)

(assert (=> b!1306775 (=> (not res!867483) (not e!745615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86991 (_ BitVec 32)) Bool)

(assert (=> b!1306775 (= res!867483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110470 res!867482) b!1306773))

(assert (= (and b!1306773 res!867484) b!1306775))

(assert (= (and b!1306775 res!867483) b!1306772))

(assert (= (and b!1306770 condMapEmpty!54181) mapIsEmpty!54181))

(assert (= (and b!1306770 (not condMapEmpty!54181)) mapNonEmpty!54181))

(get-info :version)

(assert (= (and mapNonEmpty!54181 ((_ is ValueCellFull!16619) mapValue!54181)) b!1306774))

(assert (= (and b!1306770 ((_ is ValueCellFull!16619) mapDefault!54181)) b!1306771))

(assert (= start!110470 b!1306770))

(declare-fun m!1197225 () Bool)

(assert (=> mapNonEmpty!54181 m!1197225))

(declare-fun m!1197227 () Bool)

(assert (=> start!110470 m!1197227))

(declare-fun m!1197229 () Bool)

(assert (=> start!110470 m!1197229))

(declare-fun m!1197231 () Bool)

(assert (=> start!110470 m!1197231))

(declare-fun m!1197233 () Bool)

(assert (=> b!1306772 m!1197233))

(declare-fun m!1197235 () Bool)

(assert (=> b!1306775 m!1197235))

(check-sat tp_is_empty!35035 (not b!1306775) (not start!110470) (not b!1306772) (not mapNonEmpty!54181))
(check-sat)
