; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83220 () Bool)

(assert start!83220)

(declare-fun b!969815 () Bool)

(declare-fun e!546721 () Bool)

(assert (=> b!969815 (= e!546721 false)))

(declare-fun lt!431925 () Bool)

(declare-datatypes ((array!59976 0))(
  ( (array!59977 (arr!28847 (Array (_ BitVec 32) (_ BitVec 64))) (size!29327 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59976)

(declare-datatypes ((List!19999 0))(
  ( (Nil!19996) (Cons!19995 (h!21163 (_ BitVec 64)) (t!28354 List!19999)) )
))
(declare-fun arrayNoDuplicates!0 (array!59976 (_ BitVec 32) List!19999) Bool)

(assert (=> b!969815 (= lt!431925 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!19996))))

(declare-fun b!969816 () Bool)

(declare-fun e!546720 () Bool)

(declare-fun e!546717 () Bool)

(declare-fun mapRes!34924 () Bool)

(assert (=> b!969816 (= e!546720 (and e!546717 mapRes!34924))))

(declare-fun condMapEmpty!34924 () Bool)

(declare-datatypes ((V!34241 0))(
  ( (V!34242 (val!11022 Int)) )
))
(declare-datatypes ((ValueCell!10490 0))(
  ( (ValueCellFull!10490 (v!13578 V!34241)) (EmptyCell!10490) )
))
(declare-datatypes ((array!59978 0))(
  ( (array!59979 (arr!28848 (Array (_ BitVec 32) ValueCell!10490)) (size!29328 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59978)

(declare-fun mapDefault!34924 () ValueCell!10490)

(assert (=> b!969816 (= condMapEmpty!34924 (= (arr!28848 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10490)) mapDefault!34924)))))

(declare-fun mapIsEmpty!34924 () Bool)

(assert (=> mapIsEmpty!34924 mapRes!34924))

(declare-fun b!969817 () Bool)

(declare-fun res!648921 () Bool)

(assert (=> b!969817 (=> (not res!648921) (not e!546721))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59976 (_ BitVec 32)) Bool)

(assert (=> b!969817 (= res!648921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969818 () Bool)

(declare-fun res!648923 () Bool)

(assert (=> b!969818 (=> (not res!648923) (not e!546721))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969818 (= res!648923 (and (= (size!29328 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29327 _keys!1717) (size!29328 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!648922 () Bool)

(assert (=> start!83220 (=> (not res!648922) (not e!546721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83220 (= res!648922 (validMask!0 mask!2147))))

(assert (=> start!83220 e!546721))

(assert (=> start!83220 true))

(declare-fun array_inv!22391 (array!59978) Bool)

(assert (=> start!83220 (and (array_inv!22391 _values!1425) e!546720)))

(declare-fun array_inv!22392 (array!59976) Bool)

(assert (=> start!83220 (array_inv!22392 _keys!1717)))

(declare-fun mapNonEmpty!34924 () Bool)

(declare-fun tp!66493 () Bool)

(declare-fun e!546719 () Bool)

(assert (=> mapNonEmpty!34924 (= mapRes!34924 (and tp!66493 e!546719))))

(declare-fun mapValue!34924 () ValueCell!10490)

(declare-fun mapKey!34924 () (_ BitVec 32))

(declare-fun mapRest!34924 () (Array (_ BitVec 32) ValueCell!10490))

(assert (=> mapNonEmpty!34924 (= (arr!28848 _values!1425) (store mapRest!34924 mapKey!34924 mapValue!34924))))

(declare-fun b!969819 () Bool)

(declare-fun tp_is_empty!21943 () Bool)

(assert (=> b!969819 (= e!546719 tp_is_empty!21943)))

(declare-fun b!969820 () Bool)

(assert (=> b!969820 (= e!546717 tp_is_empty!21943)))

(assert (= (and start!83220 res!648922) b!969818))

(assert (= (and b!969818 res!648923) b!969817))

(assert (= (and b!969817 res!648921) b!969815))

(assert (= (and b!969816 condMapEmpty!34924) mapIsEmpty!34924))

(assert (= (and b!969816 (not condMapEmpty!34924)) mapNonEmpty!34924))

(get-info :version)

(assert (= (and mapNonEmpty!34924 ((_ is ValueCellFull!10490) mapValue!34924)) b!969819))

(assert (= (and b!969816 ((_ is ValueCellFull!10490) mapDefault!34924)) b!969820))

(assert (= start!83220 b!969816))

(declare-fun m!898385 () Bool)

(assert (=> b!969815 m!898385))

(declare-fun m!898387 () Bool)

(assert (=> b!969817 m!898387))

(declare-fun m!898389 () Bool)

(assert (=> start!83220 m!898389))

(declare-fun m!898391 () Bool)

(assert (=> start!83220 m!898391))

(declare-fun m!898393 () Bool)

(assert (=> start!83220 m!898393))

(declare-fun m!898395 () Bool)

(assert (=> mapNonEmpty!34924 m!898395))

(check-sat (not b!969817) tp_is_empty!21943 (not mapNonEmpty!34924) (not b!969815) (not start!83220))
(check-sat)
