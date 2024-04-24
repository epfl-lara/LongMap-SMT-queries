; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85054 () Bool)

(assert start!85054)

(declare-fun mapNonEmpty!37119 () Bool)

(declare-fun mapRes!37119 () Bool)

(declare-fun tp!70191 () Bool)

(declare-fun e!560115 () Bool)

(assert (=> mapNonEmpty!37119 (= mapRes!37119 (and tp!70191 e!560115))))

(declare-fun mapKey!37119 () (_ BitVec 32))

(declare-datatypes ((V!36137 0))(
  ( (V!36138 (val!11733 Int)) )
))
(declare-datatypes ((ValueCell!11201 0))(
  ( (ValueCellFull!11201 (v!14307 V!36137)) (EmptyCell!11201) )
))
(declare-datatypes ((array!62744 0))(
  ( (array!62745 (arr!30212 (Array (_ BitVec 32) ValueCell!11201)) (size!30692 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62744)

(declare-fun mapValue!37119 () ValueCell!11201)

(declare-fun mapRest!37119 () (Array (_ BitVec 32) ValueCell!11201))

(assert (=> mapNonEmpty!37119 (= (arr!30212 _values!1551) (store mapRest!37119 mapKey!37119 mapValue!37119))))

(declare-fun b!992874 () Bool)

(declare-fun res!663372 () Bool)

(declare-fun e!560114 () Bool)

(assert (=> b!992874 (=> (not res!663372) (not e!560114))))

(declare-datatypes ((array!62746 0))(
  ( (array!62747 (arr!30213 (Array (_ BitVec 32) (_ BitVec 64))) (size!30693 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62746)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62746 (_ BitVec 32)) Bool)

(assert (=> b!992874 (= res!663372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun res!663373 () Bool)

(assert (=> start!85054 (=> (not res!663373) (not e!560114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85054 (= res!663373 (validMask!0 mask!2471))))

(assert (=> start!85054 e!560114))

(assert (=> start!85054 true))

(declare-fun e!560112 () Bool)

(declare-fun array_inv!23353 (array!62744) Bool)

(assert (=> start!85054 (and (array_inv!23353 _values!1551) e!560112)))

(declare-fun array_inv!23354 (array!62746) Bool)

(assert (=> start!85054 (array_inv!23354 _keys!1945)))

(declare-fun b!992875 () Bool)

(declare-fun tp_is_empty!23365 () Bool)

(assert (=> b!992875 (= e!560115 tp_is_empty!23365)))

(declare-fun b!992876 () Bool)

(declare-fun res!663374 () Bool)

(assert (=> b!992876 (=> (not res!663374) (not e!560114))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!992876 (= res!663374 (and (= (size!30692 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30693 _keys!1945) (size!30692 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37119 () Bool)

(assert (=> mapIsEmpty!37119 mapRes!37119))

(declare-fun b!992877 () Bool)

(declare-fun e!560113 () Bool)

(assert (=> b!992877 (= e!560113 tp_is_empty!23365)))

(declare-fun b!992878 () Bool)

(assert (=> b!992878 (= e!560114 false)))

(declare-fun lt!440396 () Bool)

(declare-datatypes ((List!20857 0))(
  ( (Nil!20854) (Cons!20853 (h!22021 (_ BitVec 64)) (t!29832 List!20857)) )
))
(declare-fun arrayNoDuplicates!0 (array!62746 (_ BitVec 32) List!20857) Bool)

(assert (=> b!992878 (= lt!440396 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20854))))

(declare-fun b!992879 () Bool)

(assert (=> b!992879 (= e!560112 (and e!560113 mapRes!37119))))

(declare-fun condMapEmpty!37119 () Bool)

(declare-fun mapDefault!37119 () ValueCell!11201)

(assert (=> b!992879 (= condMapEmpty!37119 (= (arr!30212 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11201)) mapDefault!37119)))))

(assert (= (and start!85054 res!663373) b!992876))

(assert (= (and b!992876 res!663374) b!992874))

(assert (= (and b!992874 res!663372) b!992878))

(assert (= (and b!992879 condMapEmpty!37119) mapIsEmpty!37119))

(assert (= (and b!992879 (not condMapEmpty!37119)) mapNonEmpty!37119))

(get-info :version)

(assert (= (and mapNonEmpty!37119 ((_ is ValueCellFull!11201) mapValue!37119)) b!992875))

(assert (= (and b!992879 ((_ is ValueCellFull!11201) mapDefault!37119)) b!992877))

(assert (= start!85054 b!992879))

(declare-fun m!921013 () Bool)

(assert (=> mapNonEmpty!37119 m!921013))

(declare-fun m!921015 () Bool)

(assert (=> b!992874 m!921015))

(declare-fun m!921017 () Bool)

(assert (=> start!85054 m!921017))

(declare-fun m!921019 () Bool)

(assert (=> start!85054 m!921019))

(declare-fun m!921021 () Bool)

(assert (=> start!85054 m!921021))

(declare-fun m!921023 () Bool)

(assert (=> b!992878 m!921023))

(check-sat (not start!85054) tp_is_empty!23365 (not mapNonEmpty!37119) (not b!992874) (not b!992878))
(check-sat)
