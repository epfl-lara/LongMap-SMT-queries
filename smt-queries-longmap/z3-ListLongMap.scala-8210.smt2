; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100120 () Bool)

(assert start!100120)

(declare-fun b!1193898 () Bool)

(declare-fun e!678523 () Bool)

(declare-fun e!678519 () Bool)

(assert (=> b!1193898 (= e!678523 e!678519)))

(declare-fun res!794352 () Bool)

(assert (=> b!1193898 (=> (not res!794352) (not e!678519))))

(declare-datatypes ((array!77182 0))(
  ( (array!77183 (arr!37241 (Array (_ BitVec 32) (_ BitVec 64))) (size!37779 (_ BitVec 32))) )
))
(declare-fun lt!542517 () array!77182)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77182 (_ BitVec 32)) Bool)

(assert (=> b!1193898 (= res!794352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542517 mask!1564))))

(declare-fun _keys!1208 () array!77182)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193898 (= lt!542517 (array!77183 (store (arr!37241 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37779 _keys!1208)))))

(declare-fun b!1193899 () Bool)

(declare-fun res!794347 () Bool)

(assert (=> b!1193899 (=> (not res!794347) (not e!678523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193899 (= res!794347 (validMask!0 mask!1564))))

(declare-fun b!1193900 () Bool)

(declare-fun e!678522 () Bool)

(declare-fun tp_is_empty!30235 () Bool)

(assert (=> b!1193900 (= e!678522 tp_is_empty!30235)))

(declare-fun mapIsEmpty!47180 () Bool)

(declare-fun mapRes!47180 () Bool)

(assert (=> mapIsEmpty!47180 mapRes!47180))

(declare-fun b!1193901 () Bool)

(declare-fun res!794345 () Bool)

(assert (=> b!1193901 (=> (not res!794345) (not e!678523))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193901 (= res!794345 (validKeyInArray!0 k0!934))))

(declare-fun b!1193902 () Bool)

(declare-fun e!678520 () Bool)

(assert (=> b!1193902 (= e!678520 tp_is_empty!30235)))

(declare-fun b!1193903 () Bool)

(declare-fun res!794353 () Bool)

(assert (=> b!1193903 (=> (not res!794353) (not e!678523))))

(assert (=> b!1193903 (= res!794353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47180 () Bool)

(declare-fun tp!89790 () Bool)

(assert (=> mapNonEmpty!47180 (= mapRes!47180 (and tp!89790 e!678522))))

(declare-datatypes ((V!45441 0))(
  ( (V!45442 (val!15174 Int)) )
))
(declare-datatypes ((ValueCell!14408 0))(
  ( (ValueCellFull!14408 (v!17811 V!45441)) (EmptyCell!14408) )
))
(declare-fun mapRest!47180 () (Array (_ BitVec 32) ValueCell!14408))

(declare-datatypes ((array!77184 0))(
  ( (array!77185 (arr!37242 (Array (_ BitVec 32) ValueCell!14408)) (size!37780 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77184)

(declare-fun mapKey!47180 () (_ BitVec 32))

(declare-fun mapValue!47180 () ValueCell!14408)

(assert (=> mapNonEmpty!47180 (= (arr!37242 _values!996) (store mapRest!47180 mapKey!47180 mapValue!47180))))

(declare-fun b!1193904 () Bool)

(assert (=> b!1193904 (= e!678519 false)))

(declare-fun lt!542516 () Bool)

(declare-datatypes ((List!26328 0))(
  ( (Nil!26325) (Cons!26324 (h!27533 (_ BitVec 64)) (t!38990 List!26328)) )
))
(declare-fun arrayNoDuplicates!0 (array!77182 (_ BitVec 32) List!26328) Bool)

(assert (=> b!1193904 (= lt!542516 (arrayNoDuplicates!0 lt!542517 #b00000000000000000000000000000000 Nil!26325))))

(declare-fun res!794348 () Bool)

(assert (=> start!100120 (=> (not res!794348) (not e!678523))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100120 (= res!794348 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37779 _keys!1208))))))

(assert (=> start!100120 e!678523))

(declare-fun array_inv!28512 (array!77182) Bool)

(assert (=> start!100120 (array_inv!28512 _keys!1208)))

(assert (=> start!100120 true))

(declare-fun e!678521 () Bool)

(declare-fun array_inv!28513 (array!77184) Bool)

(assert (=> start!100120 (and (array_inv!28513 _values!996) e!678521)))

(declare-fun b!1193905 () Bool)

(declare-fun res!794349 () Bool)

(assert (=> b!1193905 (=> (not res!794349) (not e!678523))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193905 (= res!794349 (and (= (size!37780 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37779 _keys!1208) (size!37780 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193906 () Bool)

(declare-fun res!794351 () Bool)

(assert (=> b!1193906 (=> (not res!794351) (not e!678523))))

(assert (=> b!1193906 (= res!794351 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37779 _keys!1208))))))

(declare-fun b!1193907 () Bool)

(assert (=> b!1193907 (= e!678521 (and e!678520 mapRes!47180))))

(declare-fun condMapEmpty!47180 () Bool)

(declare-fun mapDefault!47180 () ValueCell!14408)

(assert (=> b!1193907 (= condMapEmpty!47180 (= (arr!37242 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14408)) mapDefault!47180)))))

(declare-fun b!1193908 () Bool)

(declare-fun res!794346 () Bool)

(assert (=> b!1193908 (=> (not res!794346) (not e!678523))))

(assert (=> b!1193908 (= res!794346 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26325))))

(declare-fun b!1193909 () Bool)

(declare-fun res!794350 () Bool)

(assert (=> b!1193909 (=> (not res!794350) (not e!678523))))

(assert (=> b!1193909 (= res!794350 (= (select (arr!37241 _keys!1208) i!673) k0!934))))

(assert (= (and start!100120 res!794348) b!1193899))

(assert (= (and b!1193899 res!794347) b!1193905))

(assert (= (and b!1193905 res!794349) b!1193903))

(assert (= (and b!1193903 res!794353) b!1193908))

(assert (= (and b!1193908 res!794346) b!1193906))

(assert (= (and b!1193906 res!794351) b!1193901))

(assert (= (and b!1193901 res!794345) b!1193909))

(assert (= (and b!1193909 res!794350) b!1193898))

(assert (= (and b!1193898 res!794352) b!1193904))

(assert (= (and b!1193907 condMapEmpty!47180) mapIsEmpty!47180))

(assert (= (and b!1193907 (not condMapEmpty!47180)) mapNonEmpty!47180))

(get-info :version)

(assert (= (and mapNonEmpty!47180 ((_ is ValueCellFull!14408) mapValue!47180)) b!1193900))

(assert (= (and b!1193907 ((_ is ValueCellFull!14408) mapDefault!47180)) b!1193902))

(assert (= start!100120 b!1193907))

(declare-fun m!1101485 () Bool)

(assert (=> b!1193899 m!1101485))

(declare-fun m!1101487 () Bool)

(assert (=> b!1193908 m!1101487))

(declare-fun m!1101489 () Bool)

(assert (=> b!1193901 m!1101489))

(declare-fun m!1101491 () Bool)

(assert (=> mapNonEmpty!47180 m!1101491))

(declare-fun m!1101493 () Bool)

(assert (=> b!1193898 m!1101493))

(declare-fun m!1101495 () Bool)

(assert (=> b!1193898 m!1101495))

(declare-fun m!1101497 () Bool)

(assert (=> b!1193909 m!1101497))

(declare-fun m!1101499 () Bool)

(assert (=> b!1193903 m!1101499))

(declare-fun m!1101501 () Bool)

(assert (=> start!100120 m!1101501))

(declare-fun m!1101503 () Bool)

(assert (=> start!100120 m!1101503))

(declare-fun m!1101505 () Bool)

(assert (=> b!1193904 m!1101505))

(check-sat (not b!1193899) tp_is_empty!30235 (not mapNonEmpty!47180) (not b!1193908) (not b!1193904) (not b!1193901) (not b!1193898) (not b!1193903) (not start!100120))
(check-sat)
