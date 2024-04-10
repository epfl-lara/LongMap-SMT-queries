; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133434 () Bool)

(assert start!133434)

(declare-fun b!1559925 () Bool)

(declare-fun res!1066710 () Bool)

(declare-fun e!869206 () Bool)

(assert (=> b!1559925 (=> (not res!1066710) (not e!869206))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103760 0))(
  ( (array!103761 (arr!50072 (Array (_ BitVec 32) (_ BitVec 64))) (size!50622 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103760)

(declare-datatypes ((V!59563 0))(
  ( (V!59564 (val!19342 Int)) )
))
(declare-datatypes ((ValueCell!18228 0))(
  ( (ValueCellFull!18228 (v!22094 V!59563)) (EmptyCell!18228) )
))
(declare-datatypes ((array!103762 0))(
  ( (array!103763 (arr!50073 (Array (_ BitVec 32) ValueCell!18228)) (size!50623 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103762)

(assert (=> b!1559925 (= res!1066710 (and (= (size!50623 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50622 _keys!637) (size!50623 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559926 () Bool)

(declare-fun e!869209 () Bool)

(declare-fun tp_is_empty!38517 () Bool)

(assert (=> b!1559926 (= e!869209 tp_is_empty!38517)))

(declare-fun mapIsEmpty!59151 () Bool)

(declare-fun mapRes!59151 () Bool)

(assert (=> mapIsEmpty!59151 mapRes!59151))

(declare-fun b!1559927 () Bool)

(declare-fun res!1066712 () Bool)

(assert (=> b!1559927 (=> (not res!1066712) (not e!869206))))

(declare-datatypes ((List!36370 0))(
  ( (Nil!36367) (Cons!36366 (h!37812 (_ BitVec 64)) (t!51103 List!36370)) )
))
(declare-fun arrayNoDuplicates!0 (array!103760 (_ BitVec 32) List!36370) Bool)

(assert (=> b!1559927 (= res!1066712 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36367))))

(declare-fun b!1559928 () Bool)

(declare-fun res!1066713 () Bool)

(assert (=> b!1559928 (=> (not res!1066713) (not e!869206))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559928 (= res!1066713 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50622 _keys!637)) (bvsge from!782 (size!50622 _keys!637))))))

(declare-fun b!1559929 () Bool)

(declare-fun res!1066711 () Bool)

(assert (=> b!1559929 (=> (not res!1066711) (not e!869206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103760 (_ BitVec 32)) Bool)

(assert (=> b!1559929 (= res!1066711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559930 () Bool)

(declare-fun e!869205 () Bool)

(assert (=> b!1559930 (= e!869205 tp_is_empty!38517)))

(declare-fun b!1559931 () Bool)

(declare-fun res!1066709 () Bool)

(assert (=> b!1559931 (=> (not res!1066709) (not e!869206))))

(declare-datatypes ((tuple2!25016 0))(
  ( (tuple2!25017 (_1!12519 (_ BitVec 64)) (_2!12519 V!59563)) )
))
(declare-datatypes ((List!36371 0))(
  ( (Nil!36368) (Cons!36367 (h!37813 tuple2!25016) (t!51104 List!36371)) )
))
(declare-datatypes ((ListLongMap!22451 0))(
  ( (ListLongMap!22452 (toList!11241 List!36371)) )
))
(declare-fun contains!10231 (ListLongMap!22451 (_ BitVec 64)) Bool)

(assert (=> b!1559931 (= res!1066709 (not (contains!10231 (ListLongMap!22452 Nil!36368) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1066708 () Bool)

(assert (=> start!133434 (=> (not res!1066708) (not e!869206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133434 (= res!1066708 (validMask!0 mask!947))))

(assert (=> start!133434 e!869206))

(assert (=> start!133434 true))

(declare-fun array_inv!38921 (array!103760) Bool)

(assert (=> start!133434 (array_inv!38921 _keys!637)))

(declare-fun e!869207 () Bool)

(declare-fun array_inv!38922 (array!103762) Bool)

(assert (=> start!133434 (and (array_inv!38922 _values!487) e!869207)))

(declare-fun b!1559932 () Bool)

(assert (=> b!1559932 (= e!869207 (and e!869205 mapRes!59151))))

(declare-fun condMapEmpty!59151 () Bool)

(declare-fun mapDefault!59151 () ValueCell!18228)

(assert (=> b!1559932 (= condMapEmpty!59151 (= (arr!50073 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18228)) mapDefault!59151)))))

(declare-fun mapNonEmpty!59151 () Bool)

(declare-fun tp!112806 () Bool)

(assert (=> mapNonEmpty!59151 (= mapRes!59151 (and tp!112806 e!869209))))

(declare-fun mapKey!59151 () (_ BitVec 32))

(declare-fun mapValue!59151 () ValueCell!18228)

(declare-fun mapRest!59151 () (Array (_ BitVec 32) ValueCell!18228))

(assert (=> mapNonEmpty!59151 (= (arr!50073 _values!487) (store mapRest!59151 mapKey!59151 mapValue!59151))))

(declare-fun b!1559933 () Bool)

(assert (=> b!1559933 (= e!869206 false)))

(declare-fun lt!670932 () Bool)

(assert (=> b!1559933 (= lt!670932 (contains!10231 (ListLongMap!22452 Nil!36368) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!133434 res!1066708) b!1559925))

(assert (= (and b!1559925 res!1066710) b!1559929))

(assert (= (and b!1559929 res!1066711) b!1559927))

(assert (= (and b!1559927 res!1066712) b!1559928))

(assert (= (and b!1559928 res!1066713) b!1559931))

(assert (= (and b!1559931 res!1066709) b!1559933))

(assert (= (and b!1559932 condMapEmpty!59151) mapIsEmpty!59151))

(assert (= (and b!1559932 (not condMapEmpty!59151)) mapNonEmpty!59151))

(get-info :version)

(assert (= (and mapNonEmpty!59151 ((_ is ValueCellFull!18228) mapValue!59151)) b!1559926))

(assert (= (and b!1559932 ((_ is ValueCellFull!18228) mapDefault!59151)) b!1559930))

(assert (= start!133434 b!1559932))

(declare-fun m!1435973 () Bool)

(assert (=> mapNonEmpty!59151 m!1435973))

(declare-fun m!1435975 () Bool)

(assert (=> b!1559933 m!1435975))

(declare-fun m!1435977 () Bool)

(assert (=> b!1559931 m!1435977))

(declare-fun m!1435979 () Bool)

(assert (=> start!133434 m!1435979))

(declare-fun m!1435981 () Bool)

(assert (=> start!133434 m!1435981))

(declare-fun m!1435983 () Bool)

(assert (=> start!133434 m!1435983))

(declare-fun m!1435985 () Bool)

(assert (=> b!1559929 m!1435985))

(declare-fun m!1435987 () Bool)

(assert (=> b!1559927 m!1435987))

(check-sat (not b!1559927) (not b!1559933) (not b!1559929) (not b!1559931) tp_is_empty!38517 (not mapNonEmpty!59151) (not start!133434))
(check-sat)
