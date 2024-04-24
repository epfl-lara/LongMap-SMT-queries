; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85042 () Bool)

(assert start!85042)

(declare-fun b!992748 () Bool)

(declare-fun e!560022 () Bool)

(declare-fun tp_is_empty!23353 () Bool)

(assert (=> b!992748 (= e!560022 tp_is_empty!23353)))

(declare-fun mapIsEmpty!37101 () Bool)

(declare-fun mapRes!37101 () Bool)

(assert (=> mapIsEmpty!37101 mapRes!37101))

(declare-fun mapNonEmpty!37101 () Bool)

(declare-fun tp!70173 () Bool)

(declare-fun e!560024 () Bool)

(assert (=> mapNonEmpty!37101 (= mapRes!37101 (and tp!70173 e!560024))))

(declare-fun mapKey!37101 () (_ BitVec 32))

(declare-datatypes ((V!36121 0))(
  ( (V!36122 (val!11727 Int)) )
))
(declare-datatypes ((ValueCell!11195 0))(
  ( (ValueCellFull!11195 (v!14301 V!36121)) (EmptyCell!11195) )
))
(declare-fun mapValue!37101 () ValueCell!11195)

(declare-datatypes ((array!62722 0))(
  ( (array!62723 (arr!30201 (Array (_ BitVec 32) ValueCell!11195)) (size!30681 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62722)

(declare-fun mapRest!37101 () (Array (_ BitVec 32) ValueCell!11195))

(assert (=> mapNonEmpty!37101 (= (arr!30201 _values!1551) (store mapRest!37101 mapKey!37101 mapValue!37101))))

(declare-fun res!663301 () Bool)

(declare-fun e!560025 () Bool)

(assert (=> start!85042 (=> (not res!663301) (not e!560025))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85042 (= res!663301 (validMask!0 mask!2471))))

(assert (=> start!85042 e!560025))

(assert (=> start!85042 true))

(declare-fun e!560023 () Bool)

(declare-fun array_inv!23347 (array!62722) Bool)

(assert (=> start!85042 (and (array_inv!23347 _values!1551) e!560023)))

(declare-datatypes ((array!62724 0))(
  ( (array!62725 (arr!30202 (Array (_ BitVec 32) (_ BitVec 64))) (size!30682 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62724)

(declare-fun array_inv!23348 (array!62724) Bool)

(assert (=> start!85042 (array_inv!23348 _keys!1945)))

(declare-fun b!992749 () Bool)

(assert (=> b!992749 (= e!560024 tp_is_empty!23353)))

(declare-fun b!992750 () Bool)

(assert (=> b!992750 (= e!560025 false)))

(declare-fun lt!440387 () Bool)

(declare-datatypes ((List!20852 0))(
  ( (Nil!20849) (Cons!20848 (h!22016 (_ BitVec 64)) (t!29827 List!20852)) )
))
(declare-fun arrayNoDuplicates!0 (array!62724 (_ BitVec 32) List!20852) Bool)

(assert (=> b!992750 (= lt!440387 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20849))))

(declare-fun b!992751 () Bool)

(declare-fun res!663302 () Bool)

(assert (=> b!992751 (=> (not res!663302) (not e!560025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62724 (_ BitVec 32)) Bool)

(assert (=> b!992751 (= res!663302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!992752 () Bool)

(declare-fun res!663300 () Bool)

(assert (=> b!992752 (=> (not res!663300) (not e!560025))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!992752 (= res!663300 (and (= (size!30681 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30682 _keys!1945) (size!30681 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!992753 () Bool)

(assert (=> b!992753 (= e!560023 (and e!560022 mapRes!37101))))

(declare-fun condMapEmpty!37101 () Bool)

(declare-fun mapDefault!37101 () ValueCell!11195)

(assert (=> b!992753 (= condMapEmpty!37101 (= (arr!30201 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11195)) mapDefault!37101)))))

(assert (= (and start!85042 res!663301) b!992752))

(assert (= (and b!992752 res!663300) b!992751))

(assert (= (and b!992751 res!663302) b!992750))

(assert (= (and b!992753 condMapEmpty!37101) mapIsEmpty!37101))

(assert (= (and b!992753 (not condMapEmpty!37101)) mapNonEmpty!37101))

(get-info :version)

(assert (= (and mapNonEmpty!37101 ((_ is ValueCellFull!11195) mapValue!37101)) b!992749))

(assert (= (and b!992753 ((_ is ValueCellFull!11195) mapDefault!37101)) b!992748))

(assert (= start!85042 b!992753))

(declare-fun m!920935 () Bool)

(assert (=> mapNonEmpty!37101 m!920935))

(declare-fun m!920937 () Bool)

(assert (=> start!85042 m!920937))

(declare-fun m!920939 () Bool)

(assert (=> start!85042 m!920939))

(declare-fun m!920941 () Bool)

(assert (=> start!85042 m!920941))

(declare-fun m!920943 () Bool)

(assert (=> b!992750 m!920943))

(declare-fun m!920945 () Bool)

(assert (=> b!992751 m!920945))

(check-sat tp_is_empty!23353 (not mapNonEmpty!37101) (not b!992750) (not start!85042) (not b!992751))
(check-sat)
