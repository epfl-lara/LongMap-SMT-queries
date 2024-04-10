; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133464 () Bool)

(assert start!133464)

(declare-fun res!1066981 () Bool)

(declare-fun e!869431 () Bool)

(assert (=> start!133464 (=> (not res!1066981) (not e!869431))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133464 (= res!1066981 (validMask!0 mask!947))))

(assert (=> start!133464 e!869431))

(assert (=> start!133464 true))

(declare-datatypes ((array!103818 0))(
  ( (array!103819 (arr!50101 (Array (_ BitVec 32) (_ BitVec 64))) (size!50651 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103818)

(declare-fun array_inv!38945 (array!103818) Bool)

(assert (=> start!133464 (array_inv!38945 _keys!637)))

(declare-datatypes ((V!59603 0))(
  ( (V!59604 (val!19357 Int)) )
))
(declare-datatypes ((ValueCell!18243 0))(
  ( (ValueCellFull!18243 (v!22109 V!59603)) (EmptyCell!18243) )
))
(declare-datatypes ((array!103820 0))(
  ( (array!103821 (arr!50102 (Array (_ BitVec 32) ValueCell!18243)) (size!50652 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103820)

(declare-fun e!869434 () Bool)

(declare-fun array_inv!38946 (array!103820) Bool)

(assert (=> start!133464 (and (array_inv!38946 _values!487) e!869434)))

(declare-fun mapNonEmpty!59196 () Bool)

(declare-fun mapRes!59196 () Bool)

(declare-fun tp!112851 () Bool)

(declare-fun e!869430 () Bool)

(assert (=> mapNonEmpty!59196 (= mapRes!59196 (and tp!112851 e!869430))))

(declare-fun mapRest!59196 () (Array (_ BitVec 32) ValueCell!18243))

(declare-fun mapValue!59196 () ValueCell!18243)

(declare-fun mapKey!59196 () (_ BitVec 32))

(assert (=> mapNonEmpty!59196 (= (arr!50102 _values!487) (store mapRest!59196 mapKey!59196 mapValue!59196))))

(declare-fun b!1560330 () Bool)

(declare-fun res!1066982 () Bool)

(assert (=> b!1560330 (=> (not res!1066982) (not e!869431))))

(declare-datatypes ((List!36391 0))(
  ( (Nil!36388) (Cons!36387 (h!37833 (_ BitVec 64)) (t!51124 List!36391)) )
))
(declare-fun arrayNoDuplicates!0 (array!103818 (_ BitVec 32) List!36391) Bool)

(assert (=> b!1560330 (= res!1066982 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36388))))

(declare-fun mapIsEmpty!59196 () Bool)

(assert (=> mapIsEmpty!59196 mapRes!59196))

(declare-fun b!1560331 () Bool)

(declare-fun tp_is_empty!38547 () Bool)

(assert (=> b!1560331 (= e!869430 tp_is_empty!38547)))

(declare-fun b!1560332 () Bool)

(declare-fun res!1066978 () Bool)

(assert (=> b!1560332 (=> (not res!1066978) (not e!869431))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560332 (= res!1066978 (and (= (size!50652 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50651 _keys!637) (size!50652 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560333 () Bool)

(declare-fun res!1066983 () Bool)

(assert (=> b!1560333 (=> (not res!1066983) (not e!869431))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560333 (= res!1066983 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50651 _keys!637)) (bvsge from!782 (size!50651 _keys!637))))))

(declare-fun b!1560334 () Bool)

(declare-fun res!1066980 () Bool)

(assert (=> b!1560334 (=> (not res!1066980) (not e!869431))))

(declare-datatypes ((tuple2!25036 0))(
  ( (tuple2!25037 (_1!12529 (_ BitVec 64)) (_2!12529 V!59603)) )
))
(declare-datatypes ((List!36392 0))(
  ( (Nil!36389) (Cons!36388 (h!37834 tuple2!25036) (t!51125 List!36392)) )
))
(declare-datatypes ((ListLongMap!22471 0))(
  ( (ListLongMap!22472 (toList!11251 List!36392)) )
))
(declare-fun contains!10241 (ListLongMap!22471 (_ BitVec 64)) Bool)

(assert (=> b!1560334 (= res!1066980 (not (contains!10241 (ListLongMap!22472 Nil!36389) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1560335 () Bool)

(declare-fun e!869433 () Bool)

(assert (=> b!1560335 (= e!869433 tp_is_empty!38547)))

(declare-fun b!1560336 () Bool)

(assert (=> b!1560336 (= e!869434 (and e!869433 mapRes!59196))))

(declare-fun condMapEmpty!59196 () Bool)

(declare-fun mapDefault!59196 () ValueCell!18243)

(assert (=> b!1560336 (= condMapEmpty!59196 (= (arr!50102 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18243)) mapDefault!59196)))))

(declare-fun b!1560337 () Bool)

(assert (=> b!1560337 (= e!869431 false)))

(declare-fun lt!670977 () Bool)

(assert (=> b!1560337 (= lt!670977 (contains!10241 (ListLongMap!22472 Nil!36389) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1560338 () Bool)

(declare-fun res!1066979 () Bool)

(assert (=> b!1560338 (=> (not res!1066979) (not e!869431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103818 (_ BitVec 32)) Bool)

(assert (=> b!1560338 (= res!1066979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133464 res!1066981) b!1560332))

(assert (= (and b!1560332 res!1066978) b!1560338))

(assert (= (and b!1560338 res!1066979) b!1560330))

(assert (= (and b!1560330 res!1066982) b!1560333))

(assert (= (and b!1560333 res!1066983) b!1560334))

(assert (= (and b!1560334 res!1066980) b!1560337))

(assert (= (and b!1560336 condMapEmpty!59196) mapIsEmpty!59196))

(assert (= (and b!1560336 (not condMapEmpty!59196)) mapNonEmpty!59196))

(get-info :version)

(assert (= (and mapNonEmpty!59196 ((_ is ValueCellFull!18243) mapValue!59196)) b!1560331))

(assert (= (and b!1560336 ((_ is ValueCellFull!18243) mapDefault!59196)) b!1560335))

(assert (= start!133464 b!1560336))

(declare-fun m!1436213 () Bool)

(assert (=> b!1560338 m!1436213))

(declare-fun m!1436215 () Bool)

(assert (=> b!1560337 m!1436215))

(declare-fun m!1436217 () Bool)

(assert (=> mapNonEmpty!59196 m!1436217))

(declare-fun m!1436219 () Bool)

(assert (=> start!133464 m!1436219))

(declare-fun m!1436221 () Bool)

(assert (=> start!133464 m!1436221))

(declare-fun m!1436223 () Bool)

(assert (=> start!133464 m!1436223))

(declare-fun m!1436225 () Bool)

(assert (=> b!1560330 m!1436225))

(declare-fun m!1436227 () Bool)

(assert (=> b!1560334 m!1436227))

(check-sat (not mapNonEmpty!59196) (not b!1560338) (not b!1560337) (not b!1560334) (not start!133464) tp_is_empty!38547 (not b!1560330))
(check-sat)
