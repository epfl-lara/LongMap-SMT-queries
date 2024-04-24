; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84274 () Bool)

(assert start!84274)

(declare-fun res!658443 () Bool)

(declare-fun e!554951 () Bool)

(assert (=> start!84274 (=> (not res!658443) (not e!554951))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84274 (= res!658443 (validMask!0 mask!1948))))

(assert (=> start!84274 e!554951))

(assert (=> start!84274 true))

(declare-datatypes ((V!35529 0))(
  ( (V!35530 (val!11505 Int)) )
))
(declare-datatypes ((ValueCell!10973 0))(
  ( (ValueCellFull!10973 (v!14064 V!35529)) (EmptyCell!10973) )
))
(declare-datatypes ((array!61842 0))(
  ( (array!61843 (arr!29774 (Array (_ BitVec 32) ValueCell!10973)) (size!30254 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61842)

(declare-fun e!554949 () Bool)

(declare-fun array_inv!23037 (array!61842) Bool)

(assert (=> start!84274 (and (array_inv!23037 _values!1278) e!554949)))

(declare-datatypes ((array!61844 0))(
  ( (array!61845 (arr!29775 (Array (_ BitVec 32) (_ BitVec 64))) (size!30255 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61844)

(declare-fun array_inv!23038 (array!61844) Bool)

(assert (=> start!84274 (array_inv!23038 _keys!1544)))

(declare-fun b!984349 () Bool)

(declare-fun res!658444 () Bool)

(assert (=> b!984349 (=> (not res!658444) (not e!554951))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984349 (= res!658444 (and (= (size!30254 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30255 _keys!1544) (size!30254 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984350 () Bool)

(assert (=> b!984350 (= e!554951 false)))

(declare-fun lt!436881 () Bool)

(declare-datatypes ((List!20627 0))(
  ( (Nil!20624) (Cons!20623 (h!21791 (_ BitVec 64)) (t!29410 List!20627)) )
))
(declare-fun arrayNoDuplicates!0 (array!61844 (_ BitVec 32) List!20627) Bool)

(assert (=> b!984350 (= lt!436881 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20624))))

(declare-fun b!984351 () Bool)

(declare-fun e!554952 () Bool)

(declare-fun tp_is_empty!22909 () Bool)

(assert (=> b!984351 (= e!554952 tp_is_empty!22909)))

(declare-fun b!984352 () Bool)

(declare-fun e!554950 () Bool)

(declare-fun mapRes!36392 () Bool)

(assert (=> b!984352 (= e!554949 (and e!554950 mapRes!36392))))

(declare-fun condMapEmpty!36392 () Bool)

(declare-fun mapDefault!36392 () ValueCell!10973)

(assert (=> b!984352 (= condMapEmpty!36392 (= (arr!29774 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10973)) mapDefault!36392)))))

(declare-fun b!984353 () Bool)

(assert (=> b!984353 (= e!554950 tp_is_empty!22909)))

(declare-fun mapIsEmpty!36392 () Bool)

(assert (=> mapIsEmpty!36392 mapRes!36392))

(declare-fun b!984354 () Bool)

(declare-fun res!658442 () Bool)

(assert (=> b!984354 (=> (not res!658442) (not e!554951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61844 (_ BitVec 32)) Bool)

(assert (=> b!984354 (= res!658442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36392 () Bool)

(declare-fun tp!69077 () Bool)

(assert (=> mapNonEmpty!36392 (= mapRes!36392 (and tp!69077 e!554952))))

(declare-fun mapRest!36392 () (Array (_ BitVec 32) ValueCell!10973))

(declare-fun mapValue!36392 () ValueCell!10973)

(declare-fun mapKey!36392 () (_ BitVec 32))

(assert (=> mapNonEmpty!36392 (= (arr!29774 _values!1278) (store mapRest!36392 mapKey!36392 mapValue!36392))))

(assert (= (and start!84274 res!658443) b!984349))

(assert (= (and b!984349 res!658444) b!984354))

(assert (= (and b!984354 res!658442) b!984350))

(assert (= (and b!984352 condMapEmpty!36392) mapIsEmpty!36392))

(assert (= (and b!984352 (not condMapEmpty!36392)) mapNonEmpty!36392))

(get-info :version)

(assert (= (and mapNonEmpty!36392 ((_ is ValueCellFull!10973) mapValue!36392)) b!984351))

(assert (= (and b!984352 ((_ is ValueCellFull!10973) mapDefault!36392)) b!984353))

(assert (= start!84274 b!984352))

(declare-fun m!912011 () Bool)

(assert (=> start!84274 m!912011))

(declare-fun m!912013 () Bool)

(assert (=> start!84274 m!912013))

(declare-fun m!912015 () Bool)

(assert (=> start!84274 m!912015))

(declare-fun m!912017 () Bool)

(assert (=> b!984350 m!912017))

(declare-fun m!912019 () Bool)

(assert (=> b!984354 m!912019))

(declare-fun m!912021 () Bool)

(assert (=> mapNonEmpty!36392 m!912021))

(check-sat (not b!984350) (not mapNonEmpty!36392) tp_is_empty!22909 (not b!984354) (not start!84274))
(check-sat)
