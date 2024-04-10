; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131880 () Bool)

(assert start!131880)

(declare-fun b!1543875 () Bool)

(declare-fun e!859329 () Bool)

(declare-fun tp_is_empty!37869 () Bool)

(assert (=> b!1543875 (= e!859329 tp_is_empty!37869)))

(declare-fun res!1059213 () Bool)

(declare-fun e!859327 () Bool)

(assert (=> start!131880 (=> (not res!1059213) (not e!859327))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131880 (= res!1059213 (validMask!0 mask!926))))

(assert (=> start!131880 e!859327))

(assert (=> start!131880 true))

(declare-datatypes ((V!58935 0))(
  ( (V!58936 (val!19012 Int)) )
))
(declare-datatypes ((ValueCell!18024 0))(
  ( (ValueCellFull!18024 (v!21813 V!58935)) (EmptyCell!18024) )
))
(declare-datatypes ((array!102952 0))(
  ( (array!102953 (arr!49678 (Array (_ BitVec 32) ValueCell!18024)) (size!50228 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102952)

(declare-fun e!859325 () Bool)

(declare-fun array_inv!38643 (array!102952) Bool)

(assert (=> start!131880 (and (array_inv!38643 _values!470) e!859325)))

(declare-datatypes ((array!102954 0))(
  ( (array!102955 (arr!49679 (Array (_ BitVec 32) (_ BitVec 64))) (size!50229 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102954)

(declare-fun array_inv!38644 (array!102954) Bool)

(assert (=> start!131880 (array_inv!38644 _keys!618)))

(declare-fun mapNonEmpty!58507 () Bool)

(declare-fun mapRes!58507 () Bool)

(declare-fun tp!111034 () Bool)

(declare-fun e!859328 () Bool)

(assert (=> mapNonEmpty!58507 (= mapRes!58507 (and tp!111034 e!859328))))

(declare-fun mapValue!58507 () ValueCell!18024)

(declare-fun mapKey!58507 () (_ BitVec 32))

(declare-fun mapRest!58507 () (Array (_ BitVec 32) ValueCell!18024))

(assert (=> mapNonEmpty!58507 (= (arr!49678 _values!470) (store mapRest!58507 mapKey!58507 mapValue!58507))))

(declare-fun mapIsEmpty!58507 () Bool)

(assert (=> mapIsEmpty!58507 mapRes!58507))

(declare-fun b!1543876 () Bool)

(declare-fun res!1059212 () Bool)

(assert (=> b!1543876 (=> (not res!1059212) (not e!859327))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543876 (= res!1059212 (and (= (size!50228 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50229 _keys!618) (size!50228 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543877 () Bool)

(assert (=> b!1543877 (= e!859327 false)))

(declare-fun lt!666056 () Bool)

(declare-datatypes ((List!35934 0))(
  ( (Nil!35931) (Cons!35930 (h!37375 (_ BitVec 64)) (t!50628 List!35934)) )
))
(declare-fun arrayNoDuplicates!0 (array!102954 (_ BitVec 32) List!35934) Bool)

(assert (=> b!1543877 (= lt!666056 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35931))))

(declare-fun b!1543878 () Bool)

(assert (=> b!1543878 (= e!859328 tp_is_empty!37869)))

(declare-fun b!1543879 () Bool)

(declare-fun res!1059211 () Bool)

(assert (=> b!1543879 (=> (not res!1059211) (not e!859327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102954 (_ BitVec 32)) Bool)

(assert (=> b!1543879 (= res!1059211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543880 () Bool)

(assert (=> b!1543880 (= e!859325 (and e!859329 mapRes!58507))))

(declare-fun condMapEmpty!58507 () Bool)

(declare-fun mapDefault!58507 () ValueCell!18024)

(assert (=> b!1543880 (= condMapEmpty!58507 (= (arr!49678 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18024)) mapDefault!58507)))))

(assert (= (and start!131880 res!1059213) b!1543876))

(assert (= (and b!1543876 res!1059212) b!1543879))

(assert (= (and b!1543879 res!1059211) b!1543877))

(assert (= (and b!1543880 condMapEmpty!58507) mapIsEmpty!58507))

(assert (= (and b!1543880 (not condMapEmpty!58507)) mapNonEmpty!58507))

(get-info :version)

(assert (= (and mapNonEmpty!58507 ((_ is ValueCellFull!18024) mapValue!58507)) b!1543878))

(assert (= (and b!1543880 ((_ is ValueCellFull!18024) mapDefault!58507)) b!1543875))

(assert (= start!131880 b!1543880))

(declare-fun m!1425037 () Bool)

(assert (=> start!131880 m!1425037))

(declare-fun m!1425039 () Bool)

(assert (=> start!131880 m!1425039))

(declare-fun m!1425041 () Bool)

(assert (=> start!131880 m!1425041))

(declare-fun m!1425043 () Bool)

(assert (=> mapNonEmpty!58507 m!1425043))

(declare-fun m!1425045 () Bool)

(assert (=> b!1543877 m!1425045))

(declare-fun m!1425047 () Bool)

(assert (=> b!1543879 m!1425047))

(check-sat (not b!1543877) (not start!131880) tp_is_empty!37869 (not b!1543879) (not mapNonEmpty!58507))
(check-sat)
