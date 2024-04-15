; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100126 () Bool)

(assert start!100126)

(declare-fun b!1194006 () Bool)

(declare-fun res!794429 () Bool)

(declare-fun e!678574 () Bool)

(assert (=> b!1194006 (=> (not res!794429) (not e!678574))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77194 0))(
  ( (array!77195 (arr!37247 (Array (_ BitVec 32) (_ BitVec 64))) (size!37785 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77194)

(assert (=> b!1194006 (= res!794429 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37785 _keys!1208))))))

(declare-fun b!1194007 () Bool)

(declare-fun e!678572 () Bool)

(assert (=> b!1194007 (= e!678574 e!678572)))

(declare-fun res!794431 () Bool)

(assert (=> b!1194007 (=> (not res!794431) (not e!678572))))

(declare-fun lt!542535 () array!77194)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77194 (_ BitVec 32)) Bool)

(assert (=> b!1194007 (= res!794431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542535 mask!1564))))

(assert (=> b!1194007 (= lt!542535 (array!77195 (store (arr!37247 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37785 _keys!1208)))))

(declare-fun b!1194008 () Bool)

(declare-fun e!678576 () Bool)

(declare-fun tp_is_empty!30241 () Bool)

(assert (=> b!1194008 (= e!678576 tp_is_empty!30241)))

(declare-fun b!1194009 () Bool)

(declare-fun res!794427 () Bool)

(assert (=> b!1194009 (=> (not res!794427) (not e!678574))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194009 (= res!794427 (= (select (arr!37247 _keys!1208) i!673) k0!934))))

(declare-fun b!1194010 () Bool)

(declare-fun e!678575 () Bool)

(assert (=> b!1194010 (= e!678575 tp_is_empty!30241)))

(declare-fun b!1194011 () Bool)

(declare-fun res!794433 () Bool)

(assert (=> b!1194011 (=> (not res!794433) (not e!678574))))

(assert (=> b!1194011 (= res!794433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194012 () Bool)

(declare-fun res!794428 () Bool)

(assert (=> b!1194012 (=> (not res!794428) (not e!678574))))

(declare-datatypes ((List!26330 0))(
  ( (Nil!26327) (Cons!26326 (h!27535 (_ BitVec 64)) (t!38992 List!26330)) )
))
(declare-fun arrayNoDuplicates!0 (array!77194 (_ BitVec 32) List!26330) Bool)

(assert (=> b!1194012 (= res!794428 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26327))))

(declare-fun res!794432 () Bool)

(assert (=> start!100126 (=> (not res!794432) (not e!678574))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100126 (= res!794432 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37785 _keys!1208))))))

(assert (=> start!100126 e!678574))

(declare-fun array_inv!28516 (array!77194) Bool)

(assert (=> start!100126 (array_inv!28516 _keys!1208)))

(assert (=> start!100126 true))

(declare-datatypes ((V!45449 0))(
  ( (V!45450 (val!15177 Int)) )
))
(declare-datatypes ((ValueCell!14411 0))(
  ( (ValueCellFull!14411 (v!17814 V!45449)) (EmptyCell!14411) )
))
(declare-datatypes ((array!77196 0))(
  ( (array!77197 (arr!37248 (Array (_ BitVec 32) ValueCell!14411)) (size!37786 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77196)

(declare-fun e!678573 () Bool)

(declare-fun array_inv!28517 (array!77196) Bool)

(assert (=> start!100126 (and (array_inv!28517 _values!996) e!678573)))

(declare-fun b!1194013 () Bool)

(declare-fun mapRes!47189 () Bool)

(assert (=> b!1194013 (= e!678573 (and e!678576 mapRes!47189))))

(declare-fun condMapEmpty!47189 () Bool)

(declare-fun mapDefault!47189 () ValueCell!14411)

(assert (=> b!1194013 (= condMapEmpty!47189 (= (arr!37248 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14411)) mapDefault!47189)))))

(declare-fun b!1194014 () Bool)

(declare-fun res!794430 () Bool)

(assert (=> b!1194014 (=> (not res!794430) (not e!678574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194014 (= res!794430 (validKeyInArray!0 k0!934))))

(declare-fun b!1194015 () Bool)

(assert (=> b!1194015 (= e!678572 false)))

(declare-fun lt!542534 () Bool)

(assert (=> b!1194015 (= lt!542534 (arrayNoDuplicates!0 lt!542535 #b00000000000000000000000000000000 Nil!26327))))

(declare-fun b!1194016 () Bool)

(declare-fun res!794426 () Bool)

(assert (=> b!1194016 (=> (not res!794426) (not e!678574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194016 (= res!794426 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47189 () Bool)

(assert (=> mapIsEmpty!47189 mapRes!47189))

(declare-fun b!1194017 () Bool)

(declare-fun res!794434 () Bool)

(assert (=> b!1194017 (=> (not res!794434) (not e!678574))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194017 (= res!794434 (and (= (size!37786 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37785 _keys!1208) (size!37786 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47189 () Bool)

(declare-fun tp!89799 () Bool)

(assert (=> mapNonEmpty!47189 (= mapRes!47189 (and tp!89799 e!678575))))

(declare-fun mapRest!47189 () (Array (_ BitVec 32) ValueCell!14411))

(declare-fun mapValue!47189 () ValueCell!14411)

(declare-fun mapKey!47189 () (_ BitVec 32))

(assert (=> mapNonEmpty!47189 (= (arr!37248 _values!996) (store mapRest!47189 mapKey!47189 mapValue!47189))))

(assert (= (and start!100126 res!794432) b!1194016))

(assert (= (and b!1194016 res!794426) b!1194017))

(assert (= (and b!1194017 res!794434) b!1194011))

(assert (= (and b!1194011 res!794433) b!1194012))

(assert (= (and b!1194012 res!794428) b!1194006))

(assert (= (and b!1194006 res!794429) b!1194014))

(assert (= (and b!1194014 res!794430) b!1194009))

(assert (= (and b!1194009 res!794427) b!1194007))

(assert (= (and b!1194007 res!794431) b!1194015))

(assert (= (and b!1194013 condMapEmpty!47189) mapIsEmpty!47189))

(assert (= (and b!1194013 (not condMapEmpty!47189)) mapNonEmpty!47189))

(get-info :version)

(assert (= (and mapNonEmpty!47189 ((_ is ValueCellFull!14411) mapValue!47189)) b!1194010))

(assert (= (and b!1194013 ((_ is ValueCellFull!14411) mapDefault!47189)) b!1194008))

(assert (= start!100126 b!1194013))

(declare-fun m!1101551 () Bool)

(assert (=> b!1194012 m!1101551))

(declare-fun m!1101553 () Bool)

(assert (=> b!1194011 m!1101553))

(declare-fun m!1101555 () Bool)

(assert (=> mapNonEmpty!47189 m!1101555))

(declare-fun m!1101557 () Bool)

(assert (=> b!1194015 m!1101557))

(declare-fun m!1101559 () Bool)

(assert (=> b!1194016 m!1101559))

(declare-fun m!1101561 () Bool)

(assert (=> start!100126 m!1101561))

(declare-fun m!1101563 () Bool)

(assert (=> start!100126 m!1101563))

(declare-fun m!1101565 () Bool)

(assert (=> b!1194014 m!1101565))

(declare-fun m!1101567 () Bool)

(assert (=> b!1194007 m!1101567))

(declare-fun m!1101569 () Bool)

(assert (=> b!1194007 m!1101569))

(declare-fun m!1101571 () Bool)

(assert (=> b!1194009 m!1101571))

(check-sat (not b!1194016) (not b!1194014) tp_is_empty!30241 (not b!1194015) (not b!1194012) (not b!1194007) (not mapNonEmpty!47189) (not start!100126) (not b!1194011))
(check-sat)
