; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84292 () Bool)

(assert start!84292)

(declare-fun b!986051 () Bool)

(declare-fun e!555914 () Bool)

(declare-fun e!555913 () Bool)

(declare-fun mapRes!36698 () Bool)

(assert (=> b!986051 (= e!555914 (and e!555913 mapRes!36698))))

(declare-fun condMapEmpty!36698 () Bool)

(declare-datatypes ((V!35801 0))(
  ( (V!35802 (val!11607 Int)) )
))
(declare-datatypes ((ValueCell!11075 0))(
  ( (ValueCellFull!11075 (v!14168 V!35801)) (EmptyCell!11075) )
))
(declare-datatypes ((array!62126 0))(
  ( (array!62127 (arr!29921 (Array (_ BitVec 32) ValueCell!11075)) (size!30402 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62126)

(declare-fun mapDefault!36698 () ValueCell!11075)

(assert (=> b!986051 (= condMapEmpty!36698 (= (arr!29921 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11075)) mapDefault!36698)))))

(declare-fun b!986052 () Bool)

(declare-fun tp_is_empty!23113 () Bool)

(assert (=> b!986052 (= e!555913 tp_is_empty!23113)))

(declare-fun b!986053 () Bool)

(declare-fun res!659807 () Bool)

(declare-fun e!555910 () Bool)

(assert (=> b!986053 (=> (not res!659807) (not e!555910))))

(declare-datatypes ((array!62128 0))(
  ( (array!62129 (arr!29922 (Array (_ BitVec 32) (_ BitVec 64))) (size!30403 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62128)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62128 (_ BitVec 32)) Bool)

(assert (=> b!986053 (= res!659807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36698 () Bool)

(assert (=> mapIsEmpty!36698 mapRes!36698))

(declare-fun b!986054 () Bool)

(declare-fun e!555912 () Bool)

(assert (=> b!986054 (= e!555912 tp_is_empty!23113)))

(declare-fun res!659808 () Bool)

(assert (=> start!84292 (=> (not res!659808) (not e!555910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84292 (= res!659808 (validMask!0 mask!1948))))

(assert (=> start!84292 e!555910))

(assert (=> start!84292 true))

(declare-fun array_inv!23135 (array!62126) Bool)

(assert (=> start!84292 (and (array_inv!23135 _values!1278) e!555914)))

(declare-fun array_inv!23136 (array!62128) Bool)

(assert (=> start!84292 (array_inv!23136 _keys!1544)))

(declare-fun b!986055 () Bool)

(assert (=> b!986055 (= e!555910 false)))

(declare-fun lt!437229 () Bool)

(declare-datatypes ((List!20770 0))(
  ( (Nil!20767) (Cons!20766 (h!21928 (_ BitVec 64)) (t!29660 List!20770)) )
))
(declare-fun arrayNoDuplicates!0 (array!62128 (_ BitVec 32) List!20770) Bool)

(assert (=> b!986055 (= lt!437229 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20767))))

(declare-fun b!986056 () Bool)

(declare-fun res!659806 () Bool)

(assert (=> b!986056 (=> (not res!659806) (not e!555910))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986056 (= res!659806 (and (= (size!30402 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30403 _keys!1544) (size!30402 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36698 () Bool)

(declare-fun tp!69554 () Bool)

(assert (=> mapNonEmpty!36698 (= mapRes!36698 (and tp!69554 e!555912))))

(declare-fun mapKey!36698 () (_ BitVec 32))

(declare-fun mapRest!36698 () (Array (_ BitVec 32) ValueCell!11075))

(declare-fun mapValue!36698 () ValueCell!11075)

(assert (=> mapNonEmpty!36698 (= (arr!29921 _values!1278) (store mapRest!36698 mapKey!36698 mapValue!36698))))

(assert (= (and start!84292 res!659808) b!986056))

(assert (= (and b!986056 res!659806) b!986053))

(assert (= (and b!986053 res!659807) b!986055))

(assert (= (and b!986051 condMapEmpty!36698) mapIsEmpty!36698))

(assert (= (and b!986051 (not condMapEmpty!36698)) mapNonEmpty!36698))

(get-info :version)

(assert (= (and mapNonEmpty!36698 ((_ is ValueCellFull!11075) mapValue!36698)) b!986054))

(assert (= (and b!986051 ((_ is ValueCellFull!11075) mapDefault!36698)) b!986052))

(assert (= start!84292 b!986051))

(declare-fun m!912413 () Bool)

(assert (=> b!986053 m!912413))

(declare-fun m!912415 () Bool)

(assert (=> start!84292 m!912415))

(declare-fun m!912417 () Bool)

(assert (=> start!84292 m!912417))

(declare-fun m!912419 () Bool)

(assert (=> start!84292 m!912419))

(declare-fun m!912421 () Bool)

(assert (=> b!986055 m!912421))

(declare-fun m!912423 () Bool)

(assert (=> mapNonEmpty!36698 m!912423))

(check-sat (not mapNonEmpty!36698) (not b!986055) (not b!986053) (not start!84292) tp_is_empty!23113)
(check-sat)
