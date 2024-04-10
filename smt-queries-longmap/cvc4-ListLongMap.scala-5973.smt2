; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77668 () Bool)

(assert start!77668)

(declare-fun b_free!16253 () Bool)

(declare-fun b_next!16253 () Bool)

(assert (=> start!77668 (= b_free!16253 (not b_next!16253))))

(declare-fun tp!57021 () Bool)

(declare-fun b_and!26659 () Bool)

(assert (=> start!77668 (= tp!57021 b_and!26659)))

(declare-fun b!905697 () Bool)

(declare-fun res!611188 () Bool)

(declare-fun e!507536 () Bool)

(assert (=> b!905697 (=> (not res!611188) (not e!507536))))

(declare-datatypes ((array!53384 0))(
  ( (array!53385 (arr!25651 (Array (_ BitVec 32) (_ BitVec 64))) (size!26110 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53384)

(declare-datatypes ((List!18020 0))(
  ( (Nil!18017) (Cons!18016 (h!19162 (_ BitVec 64)) (t!25445 List!18020)) )
))
(declare-fun arrayNoDuplicates!0 (array!53384 (_ BitVec 32) List!18020) Bool)

(assert (=> b!905697 (= res!611188 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18017))))

(declare-fun b!905698 () Bool)

(declare-fun e!507533 () Bool)

(assert (=> b!905698 (= e!507533 true)))

(declare-datatypes ((V!29859 0))(
  ( (V!29860 (val!9386 Int)) )
))
(declare-datatypes ((tuple2!12210 0))(
  ( (tuple2!12211 (_1!6116 (_ BitVec 64)) (_2!6116 V!29859)) )
))
(declare-datatypes ((List!18021 0))(
  ( (Nil!18018) (Cons!18017 (h!19163 tuple2!12210) (t!25446 List!18021)) )
))
(declare-datatypes ((ListLongMap!10907 0))(
  ( (ListLongMap!10908 (toList!5469 List!18021)) )
))
(declare-fun lt!408649 () ListLongMap!10907)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!408650 () V!29859)

(declare-fun apply!458 (ListLongMap!10907 (_ BitVec 64)) V!29859)

(assert (=> b!905698 (= (apply!458 lt!408649 k!1033) lt!408650)))

(declare-datatypes ((ValueCell!8854 0))(
  ( (ValueCellFull!8854 (v!11891 V!29859)) (EmptyCell!8854) )
))
(declare-datatypes ((array!53386 0))(
  ( (array!53387 (arr!25652 (Array (_ BitVec 32) ValueCell!8854)) (size!26111 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53386)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((Unit!30730 0))(
  ( (Unit!30731) )
))
(declare-fun lt!408651 () Unit!30730)

(declare-fun zeroValue!1094 () V!29859)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29859)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!13 (array!53384 array!53386 (_ BitVec 32) (_ BitVec 32) V!29859 V!29859 (_ BitVec 64) V!29859 (_ BitVec 32) Int) Unit!30730)

(assert (=> b!905698 (= lt!408651 (lemmaListMapApplyFromThenApplyFromZero!13 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408650 i!717 defaultEntry!1160))))

(declare-fun b!905699 () Bool)

(declare-fun res!611189 () Bool)

(declare-fun e!507532 () Bool)

(assert (=> b!905699 (=> (not res!611189) (not e!507532))))

(assert (=> b!905699 (= res!611189 (and (= (select (arr!25651 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!611182 () Bool)

(assert (=> start!77668 (=> (not res!611182) (not e!507536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77668 (= res!611182 (validMask!0 mask!1756))))

(assert (=> start!77668 e!507536))

(declare-fun e!507537 () Bool)

(declare-fun array_inv!20096 (array!53386) Bool)

(assert (=> start!77668 (and (array_inv!20096 _values!1152) e!507537)))

(assert (=> start!77668 tp!57021))

(assert (=> start!77668 true))

(declare-fun tp_is_empty!18671 () Bool)

(assert (=> start!77668 tp_is_empty!18671))

(declare-fun array_inv!20097 (array!53384) Bool)

(assert (=> start!77668 (array_inv!20097 _keys!1386)))

(declare-fun b!905700 () Bool)

(assert (=> b!905700 (= e!507536 e!507532)))

(declare-fun res!611187 () Bool)

(assert (=> b!905700 (=> (not res!611187) (not e!507532))))

(declare-fun contains!4514 (ListLongMap!10907 (_ BitVec 64)) Bool)

(assert (=> b!905700 (= res!611187 (contains!4514 lt!408649 k!1033))))

(declare-fun getCurrentListMap!2735 (array!53384 array!53386 (_ BitVec 32) (_ BitVec 32) V!29859 V!29859 (_ BitVec 32) Int) ListLongMap!10907)

(assert (=> b!905700 (= lt!408649 (getCurrentListMap!2735 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905701 () Bool)

(declare-fun e!507531 () Bool)

(assert (=> b!905701 (= e!507531 tp_is_empty!18671)))

(declare-fun b!905702 () Bool)

(declare-fun e!507535 () Bool)

(declare-fun mapRes!29719 () Bool)

(assert (=> b!905702 (= e!507537 (and e!507535 mapRes!29719))))

(declare-fun condMapEmpty!29719 () Bool)

(declare-fun mapDefault!29719 () ValueCell!8854)

