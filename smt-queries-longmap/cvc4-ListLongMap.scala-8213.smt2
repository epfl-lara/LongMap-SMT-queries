; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100148 () Bool)

(assert start!100148)

(declare-fun b!1194426 () Bool)

(declare-fun e!678795 () Bool)

(declare-fun tp_is_empty!30257 () Bool)

(assert (=> b!1194426 (= e!678795 tp_is_empty!30257)))

(declare-fun b!1194427 () Bool)

(declare-fun e!678798 () Bool)

(assert (=> b!1194427 (= e!678798 tp_is_empty!30257)))

(declare-fun b!1194428 () Bool)

(declare-fun e!678797 () Bool)

(declare-datatypes ((array!77293 0))(
  ( (array!77294 (arr!37296 (Array (_ BitVec 32) (_ BitVec 64))) (size!37832 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77293)

(assert (=> b!1194428 (= e!678797 (bvsge (size!37832 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun b!1194429 () Bool)

(declare-fun res!794716 () Bool)

(declare-fun e!678799 () Bool)

(assert (=> b!1194429 (=> (not res!794716) (not e!678799))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194429 (= res!794716 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!47213 () Bool)

(declare-fun mapRes!47213 () Bool)

(declare-fun tp!89823 () Bool)

(assert (=> mapNonEmpty!47213 (= mapRes!47213 (and tp!89823 e!678795))))

(declare-datatypes ((V!45469 0))(
  ( (V!45470 (val!15185 Int)) )
))
(declare-datatypes ((ValueCell!14419 0))(
  ( (ValueCellFull!14419 (v!17823 V!45469)) (EmptyCell!14419) )
))
(declare-fun mapRest!47213 () (Array (_ BitVec 32) ValueCell!14419))

(declare-fun mapValue!47213 () ValueCell!14419)

(declare-fun mapKey!47213 () (_ BitVec 32))

(declare-datatypes ((array!77295 0))(
  ( (array!77296 (arr!37297 (Array (_ BitVec 32) ValueCell!14419)) (size!37833 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77295)

(assert (=> mapNonEmpty!47213 (= (arr!37297 _values!996) (store mapRest!47213 mapKey!47213 mapValue!47213))))

(declare-fun b!1194430 () Bool)

(declare-fun res!794722 () Bool)

(assert (=> b!1194430 (=> (not res!794722) (not e!678799))))

(declare-datatypes ((List!26262 0))(
  ( (Nil!26259) (Cons!26258 (h!27467 (_ BitVec 64)) (t!38933 List!26262)) )
))
(declare-fun arrayNoDuplicates!0 (array!77293 (_ BitVec 32) List!26262) Bool)

(assert (=> b!1194430 (= res!794722 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26259))))

(declare-fun b!1194431 () Bool)

(declare-fun res!794719 () Bool)

(assert (=> b!1194431 (=> (not res!794719) (not e!678799))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194431 (= res!794719 (validMask!0 mask!1564))))

(declare-fun b!1194432 () Bool)

(declare-fun res!794724 () Bool)

(assert (=> b!1194432 (=> (not res!794724) (not e!678799))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194432 (= res!794724 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37832 _keys!1208))))))

(declare-fun b!1194433 () Bool)

(declare-fun res!794725 () Bool)

(assert (=> b!1194433 (=> (not res!794725) (not e!678797))))

(declare-fun lt!542766 () array!77293)

(assert (=> b!1194433 (= res!794725 (arrayNoDuplicates!0 lt!542766 #b00000000000000000000000000000000 Nil!26259))))

(declare-fun res!794718 () Bool)

(assert (=> start!100148 (=> (not res!794718) (not e!678799))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100148 (= res!794718 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37832 _keys!1208))))))

(assert (=> start!100148 e!678799))

(declare-fun array_inv!28432 (array!77293) Bool)

(assert (=> start!100148 (array_inv!28432 _keys!1208)))

(assert (=> start!100148 true))

(declare-fun e!678796 () Bool)

(declare-fun array_inv!28433 (array!77295) Bool)

(assert (=> start!100148 (and (array_inv!28433 _values!996) e!678796)))

(declare-fun b!1194434 () Bool)

(assert (=> b!1194434 (= e!678799 e!678797)))

(declare-fun res!794723 () Bool)

(assert (=> b!1194434 (=> (not res!794723) (not e!678797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77293 (_ BitVec 32)) Bool)

(assert (=> b!1194434 (= res!794723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542766 mask!1564))))

(assert (=> b!1194434 (= lt!542766 (array!77294 (store (arr!37296 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37832 _keys!1208)))))

(declare-fun b!1194435 () Bool)

(declare-fun res!794720 () Bool)

(assert (=> b!1194435 (=> (not res!794720) (not e!678799))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194435 (= res!794720 (and (= (size!37833 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37832 _keys!1208) (size!37833 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194436 () Bool)

(declare-fun res!794721 () Bool)

(assert (=> b!1194436 (=> (not res!794721) (not e!678799))))

(assert (=> b!1194436 (= res!794721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47213 () Bool)

(assert (=> mapIsEmpty!47213 mapRes!47213))

(declare-fun b!1194437 () Bool)

(declare-fun res!794717 () Bool)

(assert (=> b!1194437 (=> (not res!794717) (not e!678799))))

(assert (=> b!1194437 (= res!794717 (= (select (arr!37296 _keys!1208) i!673) k!934))))

(declare-fun b!1194438 () Bool)

(assert (=> b!1194438 (= e!678796 (and e!678798 mapRes!47213))))

(declare-fun condMapEmpty!47213 () Bool)

(declare-fun mapDefault!47213 () ValueCell!14419)

