; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42286 () Bool)

(assert start!42286)

(declare-fun b_free!11791 () Bool)

(declare-fun b_next!11791 () Bool)

(assert (=> start!42286 (= b_free!11791 (not b_next!11791))))

(declare-fun tp!41400 () Bool)

(declare-fun b_and!20229 () Bool)

(assert (=> start!42286 (= tp!41400 b_and!20229)))

(declare-fun b!471856 () Bool)

(declare-fun e!276600 () Bool)

(assert (=> b!471856 (= e!276600 (not true))))

(declare-datatypes ((V!18731 0))(
  ( (V!18732 (val!6654 Int)) )
))
(declare-datatypes ((tuple2!8756 0))(
  ( (tuple2!8757 (_1!4389 (_ BitVec 64)) (_2!4389 V!18731)) )
))
(declare-datatypes ((List!8839 0))(
  ( (Nil!8836) (Cons!8835 (h!9691 tuple2!8756) (t!14805 List!8839)) )
))
(declare-datatypes ((ListLongMap!7669 0))(
  ( (ListLongMap!7670 (toList!3850 List!8839)) )
))
(declare-fun lt!214070 () ListLongMap!7669)

(declare-fun lt!214068 () ListLongMap!7669)

(assert (=> b!471856 (= lt!214070 lt!214068)))

(declare-fun minValueBefore!38 () V!18731)

(declare-fun zeroValue!794 () V!18731)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30195 0))(
  ( (array!30196 (arr!14519 (Array (_ BitVec 32) (_ BitVec 64))) (size!14871 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30195)

(declare-datatypes ((ValueCell!6266 0))(
  ( (ValueCellFull!6266 (v!8945 V!18731)) (EmptyCell!6266) )
))
(declare-datatypes ((array!30197 0))(
  ( (array!30198 (arr!14520 (Array (_ BitVec 32) ValueCell!6266)) (size!14872 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30197)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13859 0))(
  ( (Unit!13860) )
))
(declare-fun lt!214069 () Unit!13859)

(declare-fun minValueAfter!38 () V!18731)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!193 (array!30195 array!30197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18731 V!18731 V!18731 V!18731 (_ BitVec 32) Int) Unit!13859)

(assert (=> b!471856 (= lt!214069 (lemmaNoChangeToArrayThenSameMapNoExtras!193 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2013 (array!30195 array!30197 (_ BitVec 32) (_ BitVec 32) V!18731 V!18731 (_ BitVec 32) Int) ListLongMap!7669)

(assert (=> b!471856 (= lt!214068 (getCurrentListMapNoExtraKeys!2013 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471856 (= lt!214070 (getCurrentListMapNoExtraKeys!2013 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!281874 () Bool)

(assert (=> start!42286 (=> (not res!281874) (not e!276600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42286 (= res!281874 (validMask!0 mask!1365))))

(assert (=> start!42286 e!276600))

(declare-fun tp_is_empty!13219 () Bool)

(assert (=> start!42286 tp_is_empty!13219))

(assert (=> start!42286 tp!41400))

(assert (=> start!42286 true))

(declare-fun array_inv!10464 (array!30195) Bool)

(assert (=> start!42286 (array_inv!10464 _keys!1025)))

(declare-fun e!276596 () Bool)

(declare-fun array_inv!10465 (array!30197) Bool)

(assert (=> start!42286 (and (array_inv!10465 _values!833) e!276596)))

(declare-fun b!471857 () Bool)

(declare-fun res!281873 () Bool)

(assert (=> b!471857 (=> (not res!281873) (not e!276600))))

(declare-datatypes ((List!8840 0))(
  ( (Nil!8837) (Cons!8836 (h!9692 (_ BitVec 64)) (t!14806 List!8840)) )
))
(declare-fun arrayNoDuplicates!0 (array!30195 (_ BitVec 32) List!8840) Bool)

(assert (=> b!471857 (= res!281873 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8837))))

(declare-fun b!471858 () Bool)

(declare-fun res!281876 () Bool)

(assert (=> b!471858 (=> (not res!281876) (not e!276600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30195 (_ BitVec 32)) Bool)

(assert (=> b!471858 (= res!281876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471859 () Bool)

(declare-fun res!281875 () Bool)

(assert (=> b!471859 (=> (not res!281875) (not e!276600))))

(assert (=> b!471859 (= res!281875 (and (= (size!14872 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14871 _keys!1025) (size!14872 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471860 () Bool)

(declare-fun e!276597 () Bool)

(declare-fun mapRes!21535 () Bool)

(assert (=> b!471860 (= e!276596 (and e!276597 mapRes!21535))))

(declare-fun condMapEmpty!21535 () Bool)

(declare-fun mapDefault!21535 () ValueCell!6266)

