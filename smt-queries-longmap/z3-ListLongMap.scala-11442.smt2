; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133400 () Bool)

(assert start!133400)

(declare-fun res!1066728 () Bool)

(declare-fun e!869129 () Bool)

(assert (=> start!133400 (=> (not res!1066728) (not e!869129))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133400 (= res!1066728 (validMask!0 mask!947))))

(assert (=> start!133400 e!869129))

(assert (=> start!133400 true))

(declare-datatypes ((array!103710 0))(
  ( (array!103711 (arr!50048 (Array (_ BitVec 32) (_ BitVec 64))) (size!50600 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103710)

(declare-fun array_inv!39107 (array!103710) Bool)

(assert (=> start!133400 (array_inv!39107 _keys!637)))

(declare-datatypes ((V!59585 0))(
  ( (V!59586 (val!19350 Int)) )
))
(declare-datatypes ((ValueCell!18236 0))(
  ( (ValueCellFull!18236 (v!22098 V!59585)) (EmptyCell!18236) )
))
(declare-datatypes ((array!103712 0))(
  ( (array!103713 (arr!50049 (Array (_ BitVec 32) ValueCell!18236)) (size!50601 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103712)

(declare-fun e!869131 () Bool)

(declare-fun array_inv!39108 (array!103712) Bool)

(assert (=> start!133400 (and (array_inv!39108 _values!487) e!869131)))

(declare-fun b!1559828 () Bool)

(declare-fun e!869130 () Bool)

(declare-fun mapRes!59175 () Bool)

(assert (=> b!1559828 (= e!869131 (and e!869130 mapRes!59175))))

(declare-fun condMapEmpty!59175 () Bool)

(declare-fun mapDefault!59175 () ValueCell!18236)

(assert (=> b!1559828 (= condMapEmpty!59175 (= (arr!50049 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18236)) mapDefault!59175)))))

(declare-fun b!1559829 () Bool)

(declare-fun tp_is_empty!38533 () Bool)

(assert (=> b!1559829 (= e!869130 tp_is_empty!38533)))

(declare-fun mapNonEmpty!59175 () Bool)

(declare-fun tp!112831 () Bool)

(declare-fun e!869128 () Bool)

(assert (=> mapNonEmpty!59175 (= mapRes!59175 (and tp!112831 e!869128))))

(declare-fun mapValue!59175 () ValueCell!18236)

(declare-fun mapKey!59175 () (_ BitVec 32))

(declare-fun mapRest!59175 () (Array (_ BitVec 32) ValueCell!18236))

(assert (=> mapNonEmpty!59175 (= (arr!50049 _values!487) (store mapRest!59175 mapKey!59175 mapValue!59175))))

(declare-fun b!1559830 () Bool)

(assert (=> b!1559830 (= e!869129 false)))

(declare-fun lt!670670 () Bool)

(declare-datatypes ((tuple2!25100 0))(
  ( (tuple2!25101 (_1!12561 (_ BitVec 64)) (_2!12561 V!59585)) )
))
(declare-datatypes ((List!36420 0))(
  ( (Nil!36417) (Cons!36416 (h!37863 tuple2!25100) (t!51145 List!36420)) )
))
(declare-datatypes ((ListLongMap!22535 0))(
  ( (ListLongMap!22536 (toList!11283 List!36420)) )
))
(declare-fun contains!10193 (ListLongMap!22535 (_ BitVec 64)) Bool)

(assert (=> b!1559830 (= lt!670670 (contains!10193 (ListLongMap!22536 Nil!36417) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559831 () Bool)

(declare-fun res!1066726 () Bool)

(assert (=> b!1559831 (=> (not res!1066726) (not e!869129))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559831 (= res!1066726 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50600 _keys!637)) (bvsge from!782 (size!50600 _keys!637))))))

(declare-fun b!1559832 () Bool)

(declare-fun res!1066725 () Bool)

(assert (=> b!1559832 (=> (not res!1066725) (not e!869129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103710 (_ BitVec 32)) Bool)

(assert (=> b!1559832 (= res!1066725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59175 () Bool)

(assert (=> mapIsEmpty!59175 mapRes!59175))

(declare-fun b!1559833 () Bool)

(assert (=> b!1559833 (= e!869128 tp_is_empty!38533)))

(declare-fun b!1559834 () Bool)

(declare-fun res!1066727 () Bool)

(assert (=> b!1559834 (=> (not res!1066727) (not e!869129))))

(declare-datatypes ((List!36421 0))(
  ( (Nil!36418) (Cons!36417 (h!37864 (_ BitVec 64)) (t!51146 List!36421)) )
))
(declare-fun arrayNoDuplicates!0 (array!103710 (_ BitVec 32) List!36421) Bool)

(assert (=> b!1559834 (= res!1066727 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36418))))

(declare-fun b!1559835 () Bool)

(declare-fun res!1066723 () Bool)

(assert (=> b!1559835 (=> (not res!1066723) (not e!869129))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559835 (= res!1066723 (and (= (size!50601 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50600 _keys!637) (size!50601 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559836 () Bool)

(declare-fun res!1066724 () Bool)

(assert (=> b!1559836 (=> (not res!1066724) (not e!869129))))

(assert (=> b!1559836 (= res!1066724 (not (contains!10193 (ListLongMap!22536 Nil!36417) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!133400 res!1066728) b!1559835))

(assert (= (and b!1559835 res!1066723) b!1559832))

(assert (= (and b!1559832 res!1066725) b!1559834))

(assert (= (and b!1559834 res!1066727) b!1559831))

(assert (= (and b!1559831 res!1066726) b!1559836))

(assert (= (and b!1559836 res!1066724) b!1559830))

(assert (= (and b!1559828 condMapEmpty!59175) mapIsEmpty!59175))

(assert (= (and b!1559828 (not condMapEmpty!59175)) mapNonEmpty!59175))

(get-info :version)

(assert (= (and mapNonEmpty!59175 ((_ is ValueCellFull!18236) mapValue!59175)) b!1559833))

(assert (= (and b!1559828 ((_ is ValueCellFull!18236) mapDefault!59175)) b!1559829))

(assert (= start!133400 b!1559828))

(declare-fun m!1435209 () Bool)

(assert (=> b!1559830 m!1435209))

(declare-fun m!1435211 () Bool)

(assert (=> b!1559834 m!1435211))

(declare-fun m!1435213 () Bool)

(assert (=> b!1559836 m!1435213))

(declare-fun m!1435215 () Bool)

(assert (=> start!133400 m!1435215))

(declare-fun m!1435217 () Bool)

(assert (=> start!133400 m!1435217))

(declare-fun m!1435219 () Bool)

(assert (=> start!133400 m!1435219))

(declare-fun m!1435221 () Bool)

(assert (=> mapNonEmpty!59175 m!1435221))

(declare-fun m!1435223 () Bool)

(assert (=> b!1559832 m!1435223))

(check-sat (not start!133400) (not b!1559832) (not b!1559836) (not mapNonEmpty!59175) (not b!1559830) tp_is_empty!38533 (not b!1559834))
(check-sat)
