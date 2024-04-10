; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84126 () Bool)

(assert start!84126)

(declare-fun mapIsEmpty!36422 () Bool)

(declare-fun mapRes!36422 () Bool)

(assert (=> mapIsEmpty!36422 mapRes!36422))

(declare-fun b!983626 () Bool)

(declare-fun e!554516 () Bool)

(assert (=> b!983626 (= e!554516 false)))

(declare-fun lt!436550 () Bool)

(declare-datatypes ((array!61843 0))(
  ( (array!61844 (arr!29779 (Array (_ BitVec 32) (_ BitVec 64))) (size!30258 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61843)

(declare-datatypes ((List!20619 0))(
  ( (Nil!20616) (Cons!20615 (h!21777 (_ BitVec 64)) (t!29410 List!20619)) )
))
(declare-fun arrayNoDuplicates!0 (array!61843 (_ BitVec 32) List!20619) Bool)

(assert (=> b!983626 (= lt!436550 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20616))))

(declare-fun res!658189 () Bool)

(assert (=> start!84126 (=> (not res!658189) (not e!554516))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84126 (= res!658189 (validMask!0 mask!1948))))

(assert (=> start!84126 e!554516))

(assert (=> start!84126 true))

(declare-datatypes ((V!35555 0))(
  ( (V!35556 (val!11515 Int)) )
))
(declare-datatypes ((ValueCell!10983 0))(
  ( (ValueCellFull!10983 (v!14077 V!35555)) (EmptyCell!10983) )
))
(declare-datatypes ((array!61845 0))(
  ( (array!61846 (arr!29780 (Array (_ BitVec 32) ValueCell!10983)) (size!30259 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61845)

(declare-fun e!554519 () Bool)

(declare-fun array_inv!23027 (array!61845) Bool)

(assert (=> start!84126 (and (array_inv!23027 _values!1278) e!554519)))

(declare-fun array_inv!23028 (array!61843) Bool)

(assert (=> start!84126 (array_inv!23028 _keys!1544)))

(declare-fun b!983627 () Bool)

(declare-fun e!554520 () Bool)

(declare-fun tp_is_empty!22929 () Bool)

(assert (=> b!983627 (= e!554520 tp_is_empty!22929)))

(declare-fun b!983628 () Bool)

(declare-fun e!554518 () Bool)

(assert (=> b!983628 (= e!554518 tp_is_empty!22929)))

(declare-fun b!983629 () Bool)

(assert (=> b!983629 (= e!554519 (and e!554518 mapRes!36422))))

(declare-fun condMapEmpty!36422 () Bool)

(declare-fun mapDefault!36422 () ValueCell!10983)

(assert (=> b!983629 (= condMapEmpty!36422 (= (arr!29780 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10983)) mapDefault!36422)))))

(declare-fun b!983630 () Bool)

(declare-fun res!658188 () Bool)

(assert (=> b!983630 (=> (not res!658188) (not e!554516))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983630 (= res!658188 (and (= (size!30259 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30258 _keys!1544) (size!30259 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36422 () Bool)

(declare-fun tp!69106 () Bool)

(assert (=> mapNonEmpty!36422 (= mapRes!36422 (and tp!69106 e!554520))))

(declare-fun mapValue!36422 () ValueCell!10983)

(declare-fun mapRest!36422 () (Array (_ BitVec 32) ValueCell!10983))

(declare-fun mapKey!36422 () (_ BitVec 32))

(assert (=> mapNonEmpty!36422 (= (arr!29780 _values!1278) (store mapRest!36422 mapKey!36422 mapValue!36422))))

(declare-fun b!983631 () Bool)

(declare-fun res!658190 () Bool)

(assert (=> b!983631 (=> (not res!658190) (not e!554516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61843 (_ BitVec 32)) Bool)

(assert (=> b!983631 (= res!658190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84126 res!658189) b!983630))

(assert (= (and b!983630 res!658188) b!983631))

(assert (= (and b!983631 res!658190) b!983626))

(assert (= (and b!983629 condMapEmpty!36422) mapIsEmpty!36422))

(assert (= (and b!983629 (not condMapEmpty!36422)) mapNonEmpty!36422))

(get-info :version)

(assert (= (and mapNonEmpty!36422 ((_ is ValueCellFull!10983) mapValue!36422)) b!983627))

(assert (= (and b!983629 ((_ is ValueCellFull!10983) mapDefault!36422)) b!983628))

(assert (= start!84126 b!983629))

(declare-fun m!910837 () Bool)

(assert (=> b!983626 m!910837))

(declare-fun m!910839 () Bool)

(assert (=> start!84126 m!910839))

(declare-fun m!910841 () Bool)

(assert (=> start!84126 m!910841))

(declare-fun m!910843 () Bool)

(assert (=> start!84126 m!910843))

(declare-fun m!910845 () Bool)

(assert (=> mapNonEmpty!36422 m!910845))

(declare-fun m!910847 () Bool)

(assert (=> b!983631 m!910847))

(check-sat tp_is_empty!22929 (not start!84126) (not b!983631) (not b!983626) (not mapNonEmpty!36422))
(check-sat)
