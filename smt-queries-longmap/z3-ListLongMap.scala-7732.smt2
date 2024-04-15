; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97114 () Bool)

(assert start!97114)

(declare-fun mapIsEmpty!42865 () Bool)

(declare-fun mapRes!42865 () Bool)

(assert (=> mapIsEmpty!42865 mapRes!42865))

(declare-fun b!1104479 () Bool)

(declare-fun res!736920 () Bool)

(declare-fun e!630426 () Bool)

(assert (=> b!1104479 (=> (not res!736920) (not e!630426))))

(declare-datatypes ((array!71570 0))(
  ( (array!71571 (arr!34439 (Array (_ BitVec 32) (_ BitVec 64))) (size!34977 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71570)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71570 (_ BitVec 32)) Bool)

(assert (=> b!1104479 (= res!736920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104480 () Bool)

(declare-fun e!630427 () Bool)

(assert (=> b!1104480 (= e!630426 e!630427)))

(declare-fun res!736921 () Bool)

(assert (=> b!1104480 (=> (not res!736921) (not e!630427))))

(declare-fun lt!494973 () array!71570)

(assert (=> b!1104480 (= res!736921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494973 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104480 (= lt!494973 (array!71571 (store (arr!34439 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34977 _keys!1208)))))

(declare-fun b!1104481 () Bool)

(assert (=> b!1104481 (= e!630427 false)))

(declare-fun lt!494972 () Bool)

(declare-datatypes ((List!24093 0))(
  ( (Nil!24090) (Cons!24089 (h!25298 (_ BitVec 64)) (t!34349 List!24093)) )
))
(declare-fun arrayNoDuplicates!0 (array!71570 (_ BitVec 32) List!24093) Bool)

(assert (=> b!1104481 (= lt!494972 (arrayNoDuplicates!0 lt!494973 #b00000000000000000000000000000000 Nil!24090))))

(declare-fun mapNonEmpty!42865 () Bool)

(declare-fun tp!81785 () Bool)

(declare-fun e!630428 () Bool)

(assert (=> mapNonEmpty!42865 (= mapRes!42865 (and tp!81785 e!630428))))

(declare-datatypes ((V!41617 0))(
  ( (V!41618 (val!13740 Int)) )
))
(declare-datatypes ((ValueCell!12974 0))(
  ( (ValueCellFull!12974 (v!16372 V!41617)) (EmptyCell!12974) )
))
(declare-fun mapValue!42865 () ValueCell!12974)

(declare-fun mapRest!42865 () (Array (_ BitVec 32) ValueCell!12974))

(declare-datatypes ((array!71572 0))(
  ( (array!71573 (arr!34440 (Array (_ BitVec 32) ValueCell!12974)) (size!34978 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71572)

(declare-fun mapKey!42865 () (_ BitVec 32))

(assert (=> mapNonEmpty!42865 (= (arr!34440 _values!996) (store mapRest!42865 mapKey!42865 mapValue!42865))))

(declare-fun b!1104482 () Bool)

(declare-fun e!630423 () Bool)

(declare-fun tp_is_empty!27367 () Bool)

(assert (=> b!1104482 (= e!630423 tp_is_empty!27367)))

(declare-fun b!1104483 () Bool)

(declare-fun res!736926 () Bool)

(assert (=> b!1104483 (=> (not res!736926) (not e!630426))))

(assert (=> b!1104483 (= res!736926 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24090))))

(declare-fun b!1104484 () Bool)

(declare-fun res!736923 () Bool)

(assert (=> b!1104484 (=> (not res!736923) (not e!630426))))

(assert (=> b!1104484 (= res!736923 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34977 _keys!1208))))))

(declare-fun b!1104485 () Bool)

(declare-fun res!736927 () Bool)

(assert (=> b!1104485 (=> (not res!736927) (not e!630426))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104485 (= res!736927 (validKeyInArray!0 k0!934))))

(declare-fun b!1104486 () Bool)

(declare-fun e!630424 () Bool)

(assert (=> b!1104486 (= e!630424 (and e!630423 mapRes!42865))))

(declare-fun condMapEmpty!42865 () Bool)

(declare-fun mapDefault!42865 () ValueCell!12974)

(assert (=> b!1104486 (= condMapEmpty!42865 (= (arr!34440 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12974)) mapDefault!42865)))))

(declare-fun b!1104488 () Bool)

(declare-fun res!736925 () Bool)

(assert (=> b!1104488 (=> (not res!736925) (not e!630426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104488 (= res!736925 (validMask!0 mask!1564))))

(declare-fun b!1104489 () Bool)

(assert (=> b!1104489 (= e!630428 tp_is_empty!27367)))

(declare-fun b!1104490 () Bool)

(declare-fun res!736924 () Bool)

(assert (=> b!1104490 (=> (not res!736924) (not e!630426))))

(assert (=> b!1104490 (= res!736924 (= (select (arr!34439 _keys!1208) i!673) k0!934))))

(declare-fun res!736928 () Bool)

(assert (=> start!97114 (=> (not res!736928) (not e!630426))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97114 (= res!736928 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34977 _keys!1208))))))

(assert (=> start!97114 e!630426))

(declare-fun array_inv!26558 (array!71570) Bool)

(assert (=> start!97114 (array_inv!26558 _keys!1208)))

(assert (=> start!97114 true))

(declare-fun array_inv!26559 (array!71572) Bool)

(assert (=> start!97114 (and (array_inv!26559 _values!996) e!630424)))

(declare-fun b!1104487 () Bool)

(declare-fun res!736922 () Bool)

(assert (=> b!1104487 (=> (not res!736922) (not e!630426))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104487 (= res!736922 (and (= (size!34978 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34977 _keys!1208) (size!34978 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97114 res!736928) b!1104488))

(assert (= (and b!1104488 res!736925) b!1104487))

(assert (= (and b!1104487 res!736922) b!1104479))

(assert (= (and b!1104479 res!736920) b!1104483))

(assert (= (and b!1104483 res!736926) b!1104484))

(assert (= (and b!1104484 res!736923) b!1104485))

(assert (= (and b!1104485 res!736927) b!1104490))

(assert (= (and b!1104490 res!736924) b!1104480))

(assert (= (and b!1104480 res!736921) b!1104481))

(assert (= (and b!1104486 condMapEmpty!42865) mapIsEmpty!42865))

(assert (= (and b!1104486 (not condMapEmpty!42865)) mapNonEmpty!42865))

(get-info :version)

(assert (= (and mapNonEmpty!42865 ((_ is ValueCellFull!12974) mapValue!42865)) b!1104489))

(assert (= (and b!1104486 ((_ is ValueCellFull!12974) mapDefault!42865)) b!1104482))

(assert (= start!97114 b!1104486))

(declare-fun m!1023679 () Bool)

(assert (=> b!1104490 m!1023679))

(declare-fun m!1023681 () Bool)

(assert (=> b!1104479 m!1023681))

(declare-fun m!1023683 () Bool)

(assert (=> b!1104485 m!1023683))

(declare-fun m!1023685 () Bool)

(assert (=> mapNonEmpty!42865 m!1023685))

(declare-fun m!1023687 () Bool)

(assert (=> b!1104480 m!1023687))

(declare-fun m!1023689 () Bool)

(assert (=> b!1104480 m!1023689))

(declare-fun m!1023691 () Bool)

(assert (=> start!97114 m!1023691))

(declare-fun m!1023693 () Bool)

(assert (=> start!97114 m!1023693))

(declare-fun m!1023695 () Bool)

(assert (=> b!1104481 m!1023695))

(declare-fun m!1023697 () Bool)

(assert (=> b!1104483 m!1023697))

(declare-fun m!1023699 () Bool)

(assert (=> b!1104488 m!1023699))

(check-sat (not start!97114) (not b!1104481) (not b!1104488) (not b!1104485) tp_is_empty!27367 (not b!1104483) (not mapNonEmpty!42865) (not b!1104480) (not b!1104479))
(check-sat)
