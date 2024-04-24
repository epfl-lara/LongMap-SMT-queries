; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133892 () Bool)

(assert start!133892)

(declare-fun b!1562922 () Bool)

(declare-fun e!871060 () Bool)

(assert (=> b!1562922 (= e!871060 false)))

(declare-fun lt!671909 () Bool)

(declare-datatypes ((array!103970 0))(
  ( (array!103971 (arr!50170 (Array (_ BitVec 32) (_ BitVec 64))) (size!50721 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103970)

(declare-datatypes ((List!36422 0))(
  ( (Nil!36419) (Cons!36418 (h!37882 (_ BitVec 64)) (t!51147 List!36422)) )
))
(declare-fun arrayNoDuplicates!0 (array!103970 (_ BitVec 32) List!36422) Bool)

(assert (=> b!1562922 (= lt!671909 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36419))))

(declare-fun b!1562923 () Bool)

(declare-fun res!1067924 () Bool)

(assert (=> b!1562923 (=> (not res!1067924) (not e!871060))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59625 0))(
  ( (V!59626 (val!19365 Int)) )
))
(declare-datatypes ((ValueCell!18251 0))(
  ( (ValueCellFull!18251 (v!22109 V!59625)) (EmptyCell!18251) )
))
(declare-datatypes ((array!103972 0))(
  ( (array!103973 (arr!50171 (Array (_ BitVec 32) ValueCell!18251)) (size!50722 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103972)

(assert (=> b!1562923 (= res!1067924 (and (= (size!50722 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50721 _keys!637) (size!50722 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562924 () Bool)

(declare-fun e!871059 () Bool)

(declare-fun tp_is_empty!38563 () Bool)

(assert (=> b!1562924 (= e!871059 tp_is_empty!38563)))

(declare-fun b!1562925 () Bool)

(declare-fun e!871062 () Bool)

(declare-fun mapRes!59220 () Bool)

(assert (=> b!1562925 (= e!871062 (and e!871059 mapRes!59220))))

(declare-fun condMapEmpty!59220 () Bool)

(declare-fun mapDefault!59220 () ValueCell!18251)

(assert (=> b!1562925 (= condMapEmpty!59220 (= (arr!50171 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18251)) mapDefault!59220)))))

(declare-fun b!1562926 () Bool)

(declare-fun e!871063 () Bool)

(assert (=> b!1562926 (= e!871063 tp_is_empty!38563)))

(declare-fun b!1562927 () Bool)

(declare-fun res!1067923 () Bool)

(assert (=> b!1562927 (=> (not res!1067923) (not e!871060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103970 (_ BitVec 32)) Bool)

(assert (=> b!1562927 (= res!1067923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59220 () Bool)

(declare-fun tp!112875 () Bool)

(assert (=> mapNonEmpty!59220 (= mapRes!59220 (and tp!112875 e!871063))))

(declare-fun mapKey!59220 () (_ BitVec 32))

(declare-fun mapValue!59220 () ValueCell!18251)

(declare-fun mapRest!59220 () (Array (_ BitVec 32) ValueCell!18251))

(assert (=> mapNonEmpty!59220 (= (arr!50171 _values!487) (store mapRest!59220 mapKey!59220 mapValue!59220))))

(declare-fun mapIsEmpty!59220 () Bool)

(assert (=> mapIsEmpty!59220 mapRes!59220))

(declare-fun res!1067922 () Bool)

(assert (=> start!133892 (=> (not res!1067922) (not e!871060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133892 (= res!1067922 (validMask!0 mask!947))))

(assert (=> start!133892 e!871060))

(assert (=> start!133892 true))

(declare-fun array_inv!39249 (array!103972) Bool)

(assert (=> start!133892 (and (array_inv!39249 _values!487) e!871062)))

(declare-fun array_inv!39250 (array!103970) Bool)

(assert (=> start!133892 (array_inv!39250 _keys!637)))

(assert (= (and start!133892 res!1067922) b!1562923))

(assert (= (and b!1562923 res!1067924) b!1562927))

(assert (= (and b!1562927 res!1067923) b!1562922))

(assert (= (and b!1562925 condMapEmpty!59220) mapIsEmpty!59220))

(assert (= (and b!1562925 (not condMapEmpty!59220)) mapNonEmpty!59220))

(get-info :version)

(assert (= (and mapNonEmpty!59220 ((_ is ValueCellFull!18251) mapValue!59220)) b!1562926))

(assert (= (and b!1562925 ((_ is ValueCellFull!18251) mapDefault!59220)) b!1562924))

(assert (= start!133892 b!1562925))

(declare-fun m!1438575 () Bool)

(assert (=> b!1562922 m!1438575))

(declare-fun m!1438577 () Bool)

(assert (=> b!1562927 m!1438577))

(declare-fun m!1438579 () Bool)

(assert (=> mapNonEmpty!59220 m!1438579))

(declare-fun m!1438581 () Bool)

(assert (=> start!133892 m!1438581))

(declare-fun m!1438583 () Bool)

(assert (=> start!133892 m!1438583))

(declare-fun m!1438585 () Bool)

(assert (=> start!133892 m!1438585))

(check-sat (not start!133892) (not mapNonEmpty!59220) tp_is_empty!38563 (not b!1562927) (not b!1562922))
(check-sat)
