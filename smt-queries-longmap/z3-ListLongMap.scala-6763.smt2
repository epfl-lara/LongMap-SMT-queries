; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84876 () Bool)

(assert start!84876)

(declare-fun res!662965 () Bool)

(declare-fun e!559455 () Bool)

(assert (=> start!84876 (=> (not res!662965) (not e!559455))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84876 (= res!662965 (validMask!0 mask!2471))))

(assert (=> start!84876 e!559455))

(assert (=> start!84876 true))

(declare-datatypes ((V!36123 0))(
  ( (V!36124 (val!11728 Int)) )
))
(declare-datatypes ((ValueCell!11196 0))(
  ( (ValueCellFull!11196 (v!14305 V!36123)) (EmptyCell!11196) )
))
(declare-datatypes ((array!62681 0))(
  ( (array!62682 (arr!30185 (Array (_ BitVec 32) ValueCell!11196)) (size!30664 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62681)

(declare-fun e!559457 () Bool)

(declare-fun array_inv!23313 (array!62681) Bool)

(assert (=> start!84876 (and (array_inv!23313 _values!1551) e!559457)))

(declare-datatypes ((array!62683 0))(
  ( (array!62684 (arr!30186 (Array (_ BitVec 32) (_ BitVec 64))) (size!30665 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62683)

(declare-fun array_inv!23314 (array!62683) Bool)

(assert (=> start!84876 (array_inv!23314 _keys!1945)))

(declare-fun b!991863 () Bool)

(declare-fun res!662966 () Bool)

(assert (=> b!991863 (=> (not res!662966) (not e!559455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62683 (_ BitVec 32)) Bool)

(assert (=> b!991863 (= res!662966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991864 () Bool)

(declare-fun e!559458 () Bool)

(declare-fun tp_is_empty!23355 () Bool)

(assert (=> b!991864 (= e!559458 tp_is_empty!23355)))

(declare-fun mapIsEmpty!37104 () Bool)

(declare-fun mapRes!37104 () Bool)

(assert (=> mapIsEmpty!37104 mapRes!37104))

(declare-fun b!991865 () Bool)

(declare-fun res!662967 () Bool)

(assert (=> b!991865 (=> (not res!662967) (not e!559455))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991865 (= res!662967 (and (= (size!30664 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30665 _keys!1945) (size!30664 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991866 () Bool)

(assert (=> b!991866 (= e!559455 false)))

(declare-fun lt!440029 () Bool)

(declare-datatypes ((List!20865 0))(
  ( (Nil!20862) (Cons!20861 (h!22023 (_ BitVec 64)) (t!29848 List!20865)) )
))
(declare-fun arrayNoDuplicates!0 (array!62683 (_ BitVec 32) List!20865) Bool)

(assert (=> b!991866 (= lt!440029 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20862))))

(declare-fun b!991867 () Bool)

(declare-fun e!559456 () Bool)

(assert (=> b!991867 (= e!559456 tp_is_empty!23355)))

(declare-fun mapNonEmpty!37104 () Bool)

(declare-fun tp!70175 () Bool)

(assert (=> mapNonEmpty!37104 (= mapRes!37104 (and tp!70175 e!559458))))

(declare-fun mapValue!37104 () ValueCell!11196)

(declare-fun mapKey!37104 () (_ BitVec 32))

(declare-fun mapRest!37104 () (Array (_ BitVec 32) ValueCell!11196))

(assert (=> mapNonEmpty!37104 (= (arr!30185 _values!1551) (store mapRest!37104 mapKey!37104 mapValue!37104))))

(declare-fun b!991868 () Bool)

(assert (=> b!991868 (= e!559457 (and e!559456 mapRes!37104))))

(declare-fun condMapEmpty!37104 () Bool)

(declare-fun mapDefault!37104 () ValueCell!11196)

(assert (=> b!991868 (= condMapEmpty!37104 (= (arr!30185 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11196)) mapDefault!37104)))))

(assert (= (and start!84876 res!662965) b!991865))

(assert (= (and b!991865 res!662967) b!991863))

(assert (= (and b!991863 res!662966) b!991866))

(assert (= (and b!991868 condMapEmpty!37104) mapIsEmpty!37104))

(assert (= (and b!991868 (not condMapEmpty!37104)) mapNonEmpty!37104))

(get-info :version)

(assert (= (and mapNonEmpty!37104 ((_ is ValueCellFull!11196) mapValue!37104)) b!991864))

(assert (= (and b!991868 ((_ is ValueCellFull!11196) mapDefault!37104)) b!991867))

(assert (= start!84876 b!991868))

(declare-fun m!919653 () Bool)

(assert (=> start!84876 m!919653))

(declare-fun m!919655 () Bool)

(assert (=> start!84876 m!919655))

(declare-fun m!919657 () Bool)

(assert (=> start!84876 m!919657))

(declare-fun m!919659 () Bool)

(assert (=> b!991863 m!919659))

(declare-fun m!919661 () Bool)

(assert (=> b!991866 m!919661))

(declare-fun m!919663 () Bool)

(assert (=> mapNonEmpty!37104 m!919663))

(check-sat (not start!84876) (not mapNonEmpty!37104) (not b!991863) tp_is_empty!23355 (not b!991866))
(check-sat)
