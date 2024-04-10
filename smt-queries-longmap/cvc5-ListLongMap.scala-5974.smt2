; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77670 () Bool)

(assert start!77670)

(declare-fun b_free!16255 () Bool)

(declare-fun b_next!16255 () Bool)

(assert (=> start!77670 (= b_free!16255 (not b_next!16255))))

(declare-fun tp!57026 () Bool)

(declare-fun b_and!26663 () Bool)

(assert (=> start!77670 (= tp!57026 b_and!26663)))

(declare-fun b!905738 () Bool)

(declare-fun res!611218 () Bool)

(declare-fun e!507556 () Bool)

(assert (=> b!905738 (=> (not res!611218) (not e!507556))))

(declare-datatypes ((array!53388 0))(
  ( (array!53389 (arr!25653 (Array (_ BitVec 32) (_ BitVec 64))) (size!26112 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53388)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53388 (_ BitVec 32)) Bool)

(assert (=> b!905738 (= res!611218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905739 () Bool)

(declare-fun e!507561 () Bool)

(declare-fun tp_is_empty!18673 () Bool)

(assert (=> b!905739 (= e!507561 tp_is_empty!18673)))

(declare-fun b!905740 () Bool)

(declare-fun res!611215 () Bool)

(assert (=> b!905740 (=> (not res!611215) (not e!507556))))

(declare-datatypes ((List!18022 0))(
  ( (Nil!18019) (Cons!18018 (h!19164 (_ BitVec 64)) (t!25449 List!18022)) )
))
(declare-fun arrayNoDuplicates!0 (array!53388 (_ BitVec 32) List!18022) Bool)

(assert (=> b!905740 (= res!611215 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18019))))

(declare-fun b!905742 () Bool)

(declare-fun e!507555 () Bool)

(declare-fun e!507560 () Bool)

(assert (=> b!905742 (= e!507555 e!507560)))

(declare-fun res!611219 () Bool)

(assert (=> b!905742 (=> res!611219 e!507560)))

(declare-datatypes ((V!29863 0))(
  ( (V!29864 (val!9387 Int)) )
))
(declare-datatypes ((tuple2!12212 0))(
  ( (tuple2!12213 (_1!6117 (_ BitVec 64)) (_2!6117 V!29863)) )
))
(declare-datatypes ((List!18023 0))(
  ( (Nil!18020) (Cons!18019 (h!19165 tuple2!12212) (t!25450 List!18023)) )
))
(declare-datatypes ((ListLongMap!10909 0))(
  ( (ListLongMap!10910 (toList!5470 List!18023)) )
))
(declare-fun lt!408666 () ListLongMap!10909)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4515 (ListLongMap!10909 (_ BitVec 64)) Bool)

(assert (=> b!905742 (= res!611219 (not (contains!4515 lt!408666 k!1033)))))

(declare-datatypes ((ValueCell!8855 0))(
  ( (ValueCellFull!8855 (v!11892 V!29863)) (EmptyCell!8855) )
))
(declare-datatypes ((array!53390 0))(
  ( (array!53391 (arr!25654 (Array (_ BitVec 32) ValueCell!8855)) (size!26113 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53390)

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29863)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29863)

(declare-fun getCurrentListMap!2736 (array!53388 array!53390 (_ BitVec 32) (_ BitVec 32) V!29863 V!29863 (_ BitVec 32) Int) ListLongMap!10909)

(assert (=> b!905742 (= lt!408666 (getCurrentListMap!2736 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905743 () Bool)

(declare-fun res!611217 () Bool)

(declare-fun e!507554 () Bool)

(assert (=> b!905743 (=> (not res!611217) (not e!507554))))

(assert (=> b!905743 (= res!611217 (and (= (select (arr!25653 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905744 () Bool)

(declare-fun res!611216 () Bool)

(assert (=> b!905744 (=> (not res!611216) (not e!507554))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905744 (= res!611216 (inRange!0 i!717 mask!1756))))

(declare-fun b!905745 () Bool)

(declare-fun e!507557 () Bool)

(assert (=> b!905745 (= e!507557 tp_is_empty!18673)))

(declare-fun b!905746 () Bool)

(assert (=> b!905746 (= e!507556 e!507554)))

(declare-fun res!611210 () Bool)

(assert (=> b!905746 (=> (not res!611210) (not e!507554))))

(declare-fun lt!408664 () ListLongMap!10909)

(assert (=> b!905746 (= res!611210 (contains!4515 lt!408664 k!1033))))

(assert (=> b!905746 (= lt!408664 (getCurrentListMap!2736 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905747 () Bool)

(assert (=> b!905747 (= e!507560 true)))

(declare-fun lt!408662 () V!29863)

(declare-fun apply!459 (ListLongMap!10909 (_ BitVec 64)) V!29863)

(assert (=> b!905747 (= (apply!459 lt!408664 k!1033) lt!408662)))

(declare-datatypes ((Unit!30732 0))(
  ( (Unit!30733) )
))
(declare-fun lt!408663 () Unit!30732)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!14 (array!53388 array!53390 (_ BitVec 32) (_ BitVec 32) V!29863 V!29863 (_ BitVec 64) V!29863 (_ BitVec 32) Int) Unit!30732)

(assert (=> b!905747 (= lt!408663 (lemmaListMapApplyFromThenApplyFromZero!14 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408662 i!717 defaultEntry!1160))))

(declare-fun b!905748 () Bool)

(declare-fun res!611211 () Bool)

(assert (=> b!905748 (=> (not res!611211) (not e!507556))))

(assert (=> b!905748 (= res!611211 (and (= (size!26113 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26112 _keys!1386) (size!26113 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905749 () Bool)

(declare-fun e!507559 () Bool)

(declare-fun mapRes!29722 () Bool)

(assert (=> b!905749 (= e!507559 (and e!507557 mapRes!29722))))

(declare-fun condMapEmpty!29722 () Bool)

(declare-fun mapDefault!29722 () ValueCell!8855)

