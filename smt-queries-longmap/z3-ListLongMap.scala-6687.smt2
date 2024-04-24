; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84262 () Bool)

(assert start!84262)

(declare-fun b!984241 () Bool)

(declare-fun e!554861 () Bool)

(assert (=> b!984241 (= e!554861 false)))

(declare-fun lt!436863 () Bool)

(declare-datatypes ((array!61820 0))(
  ( (array!61821 (arr!29763 (Array (_ BitVec 32) (_ BitVec 64))) (size!30243 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61820)

(declare-datatypes ((List!20624 0))(
  ( (Nil!20621) (Cons!20620 (h!21788 (_ BitVec 64)) (t!29407 List!20624)) )
))
(declare-fun arrayNoDuplicates!0 (array!61820 (_ BitVec 32) List!20624) Bool)

(assert (=> b!984241 (= lt!436863 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20621))))

(declare-fun b!984242 () Bool)

(declare-fun e!554862 () Bool)

(declare-fun e!554859 () Bool)

(declare-fun mapRes!36374 () Bool)

(assert (=> b!984242 (= e!554862 (and e!554859 mapRes!36374))))

(declare-fun condMapEmpty!36374 () Bool)

(declare-datatypes ((V!35513 0))(
  ( (V!35514 (val!11499 Int)) )
))
(declare-datatypes ((ValueCell!10967 0))(
  ( (ValueCellFull!10967 (v!14058 V!35513)) (EmptyCell!10967) )
))
(declare-datatypes ((array!61822 0))(
  ( (array!61823 (arr!29764 (Array (_ BitVec 32) ValueCell!10967)) (size!30244 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61822)

(declare-fun mapDefault!36374 () ValueCell!10967)

(assert (=> b!984242 (= condMapEmpty!36374 (= (arr!29764 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10967)) mapDefault!36374)))))

(declare-fun mapNonEmpty!36374 () Bool)

(declare-fun tp!69059 () Bool)

(declare-fun e!554858 () Bool)

(assert (=> mapNonEmpty!36374 (= mapRes!36374 (and tp!69059 e!554858))))

(declare-fun mapRest!36374 () (Array (_ BitVec 32) ValueCell!10967))

(declare-fun mapValue!36374 () ValueCell!10967)

(declare-fun mapKey!36374 () (_ BitVec 32))

(assert (=> mapNonEmpty!36374 (= (arr!29764 _values!1278) (store mapRest!36374 mapKey!36374 mapValue!36374))))

(declare-fun b!984243 () Bool)

(declare-fun res!658388 () Bool)

(assert (=> b!984243 (=> (not res!658388) (not e!554861))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984243 (= res!658388 (and (= (size!30244 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30243 _keys!1544) (size!30244 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!658389 () Bool)

(assert (=> start!84262 (=> (not res!658389) (not e!554861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84262 (= res!658389 (validMask!0 mask!1948))))

(assert (=> start!84262 e!554861))

(assert (=> start!84262 true))

(declare-fun array_inv!23031 (array!61822) Bool)

(assert (=> start!84262 (and (array_inv!23031 _values!1278) e!554862)))

(declare-fun array_inv!23032 (array!61820) Bool)

(assert (=> start!84262 (array_inv!23032 _keys!1544)))

(declare-fun b!984244 () Bool)

(declare-fun tp_is_empty!22897 () Bool)

(assert (=> b!984244 (= e!554859 tp_is_empty!22897)))

(declare-fun b!984245 () Bool)

(declare-fun res!658390 () Bool)

(assert (=> b!984245 (=> (not res!658390) (not e!554861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61820 (_ BitVec 32)) Bool)

(assert (=> b!984245 (= res!658390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984246 () Bool)

(assert (=> b!984246 (= e!554858 tp_is_empty!22897)))

(declare-fun mapIsEmpty!36374 () Bool)

(assert (=> mapIsEmpty!36374 mapRes!36374))

(assert (= (and start!84262 res!658389) b!984243))

(assert (= (and b!984243 res!658388) b!984245))

(assert (= (and b!984245 res!658390) b!984241))

(assert (= (and b!984242 condMapEmpty!36374) mapIsEmpty!36374))

(assert (= (and b!984242 (not condMapEmpty!36374)) mapNonEmpty!36374))

(get-info :version)

(assert (= (and mapNonEmpty!36374 ((_ is ValueCellFull!10967) mapValue!36374)) b!984246))

(assert (= (and b!984242 ((_ is ValueCellFull!10967) mapDefault!36374)) b!984244))

(assert (= start!84262 b!984242))

(declare-fun m!911939 () Bool)

(assert (=> b!984241 m!911939))

(declare-fun m!911941 () Bool)

(assert (=> mapNonEmpty!36374 m!911941))

(declare-fun m!911943 () Bool)

(assert (=> start!84262 m!911943))

(declare-fun m!911945 () Bool)

(assert (=> start!84262 m!911945))

(declare-fun m!911947 () Bool)

(assert (=> start!84262 m!911947))

(declare-fun m!911949 () Bool)

(assert (=> b!984245 m!911949))

(check-sat (not b!984241) (not mapNonEmpty!36374) (not b!984245) tp_is_empty!22897 (not start!84262))
(check-sat)
