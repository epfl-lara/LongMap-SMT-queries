; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78912 () Bool)

(assert start!78912)

(declare-fun b_free!17125 () Bool)

(declare-fun b_next!17125 () Bool)

(assert (=> start!78912 (= b_free!17125 (not b_next!17125))))

(declare-fun tp!59815 () Bool)

(declare-fun b_and!27987 () Bool)

(assert (=> start!78912 (= tp!59815 b_and!27987)))

(declare-fun b!922659 () Bool)

(declare-fun e!517695 () Bool)

(declare-fun e!517696 () Bool)

(assert (=> b!922659 (= e!517695 e!517696)))

(declare-fun res!622184 () Bool)

(assert (=> b!922659 (=> (not res!622184) (not e!517696))))

(declare-datatypes ((V!31143 0))(
  ( (V!31144 (val!9867 Int)) )
))
(declare-datatypes ((tuple2!12836 0))(
  ( (tuple2!12837 (_1!6429 (_ BitVec 64)) (_2!6429 V!31143)) )
))
(declare-datatypes ((List!18641 0))(
  ( (Nil!18638) (Cons!18637 (h!19783 tuple2!12836) (t!26496 List!18641)) )
))
(declare-datatypes ((ListLongMap!11533 0))(
  ( (ListLongMap!11534 (toList!5782 List!18641)) )
))
(declare-fun lt!414368 () ListLongMap!11533)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4845 (ListLongMap!11533 (_ BitVec 64)) Bool)

(assert (=> b!922659 (= res!622184 (contains!4845 lt!414368 k!1099))))

(declare-datatypes ((array!55242 0))(
  ( (array!55243 (arr!26566 (Array (_ BitVec 32) (_ BitVec 64))) (size!27025 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55242)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9335 0))(
  ( (ValueCellFull!9335 (v!12385 V!31143)) (EmptyCell!9335) )
))
(declare-datatypes ((array!55244 0))(
  ( (array!55245 (arr!26567 (Array (_ BitVec 32) ValueCell!9335)) (size!27026 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55244)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31143)

(declare-fun minValue!1173 () V!31143)

(declare-fun getCurrentListMap!3036 (array!55242 array!55244 (_ BitVec 32) (_ BitVec 32) V!31143 V!31143 (_ BitVec 32) Int) ListLongMap!11533)

(assert (=> b!922659 (= lt!414368 (getCurrentListMap!3036 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!622188 () Bool)

(assert (=> start!78912 (=> (not res!622188) (not e!517695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78912 (= res!622188 (validMask!0 mask!1881))))

(assert (=> start!78912 e!517695))

(assert (=> start!78912 true))

(declare-fun tp_is_empty!19633 () Bool)

(assert (=> start!78912 tp_is_empty!19633))

(declare-fun e!517693 () Bool)

(declare-fun array_inv!20692 (array!55244) Bool)

(assert (=> start!78912 (and (array_inv!20692 _values!1231) e!517693)))

(assert (=> start!78912 tp!59815))

(declare-fun array_inv!20693 (array!55242) Bool)

(assert (=> start!78912 (array_inv!20693 _keys!1487)))

(declare-fun b!922660 () Bool)

(declare-fun e!517691 () Bool)

(assert (=> b!922660 (= e!517691 tp_is_empty!19633)))

(declare-fun b!922661 () Bool)

(declare-fun res!622192 () Bool)

(assert (=> b!922661 (=> (not res!622192) (not e!517695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55242 (_ BitVec 32)) Bool)

(assert (=> b!922661 (= res!622192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31206 () Bool)

(declare-fun mapRes!31206 () Bool)

(declare-fun tp!59816 () Bool)

(declare-fun e!517692 () Bool)

(assert (=> mapNonEmpty!31206 (= mapRes!31206 (and tp!59816 e!517692))))

(declare-fun mapKey!31206 () (_ BitVec 32))

(declare-fun mapRest!31206 () (Array (_ BitVec 32) ValueCell!9335))

(declare-fun mapValue!31206 () ValueCell!9335)

(assert (=> mapNonEmpty!31206 (= (arr!26567 _values!1231) (store mapRest!31206 mapKey!31206 mapValue!31206))))

(declare-fun b!922662 () Bool)

(declare-fun res!622186 () Bool)

(assert (=> b!922662 (=> (not res!622186) (not e!517695))))

(declare-datatypes ((List!18642 0))(
  ( (Nil!18639) (Cons!18638 (h!19784 (_ BitVec 64)) (t!26497 List!18642)) )
))
(declare-fun arrayNoDuplicates!0 (array!55242 (_ BitVec 32) List!18642) Bool)

(assert (=> b!922662 (= res!622186 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18639))))

(declare-fun b!922663 () Bool)

(declare-fun res!622190 () Bool)

(assert (=> b!922663 (=> (not res!622190) (not e!517695))))

(assert (=> b!922663 (= res!622190 (and (= (size!27026 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27025 _keys!1487) (size!27026 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922664 () Bool)

(declare-fun res!622187 () Bool)

(assert (=> b!922664 (=> (not res!622187) (not e!517696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922664 (= res!622187 (validKeyInArray!0 k!1099))))

(declare-fun mapIsEmpty!31206 () Bool)

(assert (=> mapIsEmpty!31206 mapRes!31206))

(declare-fun b!922665 () Bool)

(declare-fun res!622189 () Bool)

(assert (=> b!922665 (=> (not res!622189) (not e!517696))))

(assert (=> b!922665 (= res!622189 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922666 () Bool)

(declare-fun e!517690 () Bool)

(assert (=> b!922666 (= e!517696 e!517690)))

(declare-fun res!622183 () Bool)

(assert (=> b!922666 (=> (not res!622183) (not e!517690))))

(declare-fun lt!414365 () (_ BitVec 64))

(assert (=> b!922666 (= res!622183 (validKeyInArray!0 lt!414365))))

(assert (=> b!922666 (= lt!414365 (select (arr!26566 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922667 () Bool)

(declare-fun res!622191 () Bool)

(assert (=> b!922667 (=> (not res!622191) (not e!517696))))

(declare-fun v!791 () V!31143)

(declare-fun apply!617 (ListLongMap!11533 (_ BitVec 64)) V!31143)

(assert (=> b!922667 (= res!622191 (= (apply!617 lt!414368 k!1099) v!791))))

(declare-fun b!922668 () Bool)

(declare-fun e!517689 () Bool)

(assert (=> b!922668 (= e!517689 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922669 () Bool)

(assert (=> b!922669 (= e!517690 (not true))))

(assert (=> b!922669 (not (= lt!414365 k!1099))))

(declare-datatypes ((Unit!31122 0))(
  ( (Unit!31123) )
))
(declare-fun lt!414364 () Unit!31122)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55242 (_ BitVec 64) (_ BitVec 32) List!18642) Unit!31122)

(assert (=> b!922669 (= lt!414364 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18639))))

(assert (=> b!922669 e!517689))

(declare-fun c!96189 () Bool)

(assert (=> b!922669 (= c!96189 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414367 () Unit!31122)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!194 (array!55242 array!55244 (_ BitVec 32) (_ BitVec 32) V!31143 V!31143 (_ BitVec 64) (_ BitVec 32) Int) Unit!31122)

(assert (=> b!922669 (= lt!414367 (lemmaListMapContainsThenArrayContainsFrom!194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922669 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18639)))

(declare-fun lt!414362 () Unit!31122)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55242 (_ BitVec 32) (_ BitVec 32)) Unit!31122)

(assert (=> b!922669 (= lt!414362 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414363 () tuple2!12836)

(declare-fun +!2687 (ListLongMap!11533 tuple2!12836) ListLongMap!11533)

(assert (=> b!922669 (contains!4845 (+!2687 lt!414368 lt!414363) k!1099)))

(declare-fun lt!414366 () V!31143)

(declare-fun lt!414370 () Unit!31122)

(declare-fun addStillContains!411 (ListLongMap!11533 (_ BitVec 64) V!31143 (_ BitVec 64)) Unit!31122)

(assert (=> b!922669 (= lt!414370 (addStillContains!411 lt!414368 lt!414365 lt!414366 k!1099))))

(assert (=> b!922669 (= (getCurrentListMap!3036 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2687 (getCurrentListMap!3036 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414363))))

(assert (=> b!922669 (= lt!414363 (tuple2!12837 lt!414365 lt!414366))))

(declare-fun get!13952 (ValueCell!9335 V!31143) V!31143)

(declare-fun dynLambda!1476 (Int (_ BitVec 64)) V!31143)

(assert (=> b!922669 (= lt!414366 (get!13952 (select (arr!26567 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1476 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414369 () Unit!31122)

(declare-fun lemmaListMapRecursiveValidKeyArray!77 (array!55242 array!55244 (_ BitVec 32) (_ BitVec 32) V!31143 V!31143 (_ BitVec 32) Int) Unit!31122)

(assert (=> b!922669 (= lt!414369 (lemmaListMapRecursiveValidKeyArray!77 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922670 () Bool)

(declare-fun res!622185 () Bool)

(assert (=> b!922670 (=> (not res!622185) (not e!517695))))

(assert (=> b!922670 (= res!622185 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27025 _keys!1487))))))

(declare-fun b!922671 () Bool)

(assert (=> b!922671 (= e!517692 tp_is_empty!19633)))

(declare-fun b!922672 () Bool)

(assert (=> b!922672 (= e!517693 (and e!517691 mapRes!31206))))

(declare-fun condMapEmpty!31206 () Bool)

(declare-fun mapDefault!31206 () ValueCell!9335)

