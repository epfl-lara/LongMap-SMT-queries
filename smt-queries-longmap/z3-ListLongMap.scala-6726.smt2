; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84310 () Bool)

(assert start!84310)

(declare-fun b!986213 () Bool)

(declare-fun e!556047 () Bool)

(declare-fun e!556046 () Bool)

(declare-fun mapRes!36725 () Bool)

(assert (=> b!986213 (= e!556047 (and e!556046 mapRes!36725))))

(declare-fun condMapEmpty!36725 () Bool)

(declare-datatypes ((V!35825 0))(
  ( (V!35826 (val!11616 Int)) )
))
(declare-datatypes ((ValueCell!11084 0))(
  ( (ValueCellFull!11084 (v!14177 V!35825)) (EmptyCell!11084) )
))
(declare-datatypes ((array!62158 0))(
  ( (array!62159 (arr!29937 (Array (_ BitVec 32) ValueCell!11084)) (size!30418 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62158)

(declare-fun mapDefault!36725 () ValueCell!11084)

(assert (=> b!986213 (= condMapEmpty!36725 (= (arr!29937 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11084)) mapDefault!36725)))))

(declare-fun res!659889 () Bool)

(declare-fun e!556049 () Bool)

(assert (=> start!84310 (=> (not res!659889) (not e!556049))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84310 (= res!659889 (validMask!0 mask!1948))))

(assert (=> start!84310 e!556049))

(assert (=> start!84310 true))

(declare-fun array_inv!23147 (array!62158) Bool)

(assert (=> start!84310 (and (array_inv!23147 _values!1278) e!556047)))

(declare-datatypes ((array!62160 0))(
  ( (array!62161 (arr!29938 (Array (_ BitVec 32) (_ BitVec 64))) (size!30419 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62160)

(declare-fun array_inv!23148 (array!62160) Bool)

(assert (=> start!84310 (array_inv!23148 _keys!1544)))

(declare-fun b!986214 () Bool)

(declare-fun res!659887 () Bool)

(assert (=> b!986214 (=> (not res!659887) (not e!556049))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986214 (= res!659887 (and (= (size!30418 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30419 _keys!1544) (size!30418 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986215 () Bool)

(assert (=> b!986215 (= e!556049 false)))

(declare-fun lt!437256 () Bool)

(declare-datatypes ((List!20775 0))(
  ( (Nil!20772) (Cons!20771 (h!21933 (_ BitVec 64)) (t!29665 List!20775)) )
))
(declare-fun arrayNoDuplicates!0 (array!62160 (_ BitVec 32) List!20775) Bool)

(assert (=> b!986215 (= lt!437256 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20772))))

(declare-fun mapIsEmpty!36725 () Bool)

(assert (=> mapIsEmpty!36725 mapRes!36725))

(declare-fun b!986216 () Bool)

(declare-fun e!556045 () Bool)

(declare-fun tp_is_empty!23131 () Bool)

(assert (=> b!986216 (= e!556045 tp_is_empty!23131)))

(declare-fun b!986217 () Bool)

(declare-fun res!659888 () Bool)

(assert (=> b!986217 (=> (not res!659888) (not e!556049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62160 (_ BitVec 32)) Bool)

(assert (=> b!986217 (= res!659888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986218 () Bool)

(assert (=> b!986218 (= e!556046 tp_is_empty!23131)))

(declare-fun mapNonEmpty!36725 () Bool)

(declare-fun tp!69581 () Bool)

(assert (=> mapNonEmpty!36725 (= mapRes!36725 (and tp!69581 e!556045))))

(declare-fun mapKey!36725 () (_ BitVec 32))

(declare-fun mapValue!36725 () ValueCell!11084)

(declare-fun mapRest!36725 () (Array (_ BitVec 32) ValueCell!11084))

(assert (=> mapNonEmpty!36725 (= (arr!29937 _values!1278) (store mapRest!36725 mapKey!36725 mapValue!36725))))

(assert (= (and start!84310 res!659889) b!986214))

(assert (= (and b!986214 res!659887) b!986217))

(assert (= (and b!986217 res!659888) b!986215))

(assert (= (and b!986213 condMapEmpty!36725) mapIsEmpty!36725))

(assert (= (and b!986213 (not condMapEmpty!36725)) mapNonEmpty!36725))

(get-info :version)

(assert (= (and mapNonEmpty!36725 ((_ is ValueCellFull!11084) mapValue!36725)) b!986216))

(assert (= (and b!986213 ((_ is ValueCellFull!11084) mapDefault!36725)) b!986218))

(assert (= start!84310 b!986213))

(declare-fun m!912521 () Bool)

(assert (=> start!84310 m!912521))

(declare-fun m!912523 () Bool)

(assert (=> start!84310 m!912523))

(declare-fun m!912525 () Bool)

(assert (=> start!84310 m!912525))

(declare-fun m!912527 () Bool)

(assert (=> b!986215 m!912527))

(declare-fun m!912529 () Bool)

(assert (=> b!986217 m!912529))

(declare-fun m!912531 () Bool)

(assert (=> mapNonEmpty!36725 m!912531))

(check-sat (not start!84310) (not mapNonEmpty!36725) tp_is_empty!23131 (not b!986215) (not b!986217))
(check-sat)
