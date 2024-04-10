; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70594 () Bool)

(assert start!70594)

(declare-fun b_free!12901 () Bool)

(declare-fun b_next!12901 () Bool)

(assert (=> start!70594 (= b_free!12901 (not b_next!12901))))

(declare-fun tp!45439 () Bool)

(declare-fun b_and!21743 () Bool)

(assert (=> start!70594 (= tp!45439 b_and!21743)))

(declare-fun b!820115 () Bool)

(declare-fun e!455583 () Bool)

(declare-fun e!455577 () Bool)

(assert (=> b!820115 (= e!455583 (not e!455577))))

(declare-fun res!559605 () Bool)

(assert (=> b!820115 (=> res!559605 e!455577)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820115 (= res!559605 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24483 0))(
  ( (V!24484 (val!7353 Int)) )
))
(declare-datatypes ((tuple2!9684 0))(
  ( (tuple2!9685 (_1!4853 (_ BitVec 64)) (_2!4853 V!24483)) )
))
(declare-datatypes ((List!15507 0))(
  ( (Nil!15504) (Cons!15503 (h!16632 tuple2!9684) (t!21838 List!15507)) )
))
(declare-datatypes ((ListLongMap!8507 0))(
  ( (ListLongMap!8508 (toList!4269 List!15507)) )
))
(declare-fun lt!368463 () ListLongMap!8507)

(declare-fun lt!368461 () ListLongMap!8507)

(assert (=> b!820115 (= lt!368463 lt!368461)))

(declare-fun zeroValueBefore!34 () V!24483)

(declare-datatypes ((array!45416 0))(
  ( (array!45417 (arr!21761 (Array (_ BitVec 32) (_ BitVec 64))) (size!22182 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45416)

(declare-fun zeroValueAfter!34 () V!24483)

(declare-fun minValue!754 () V!24483)

(declare-datatypes ((ValueCell!6890 0))(
  ( (ValueCellFull!6890 (v!9783 V!24483)) (EmptyCell!6890) )
))
(declare-datatypes ((array!45418 0))(
  ( (array!45419 (arr!21762 (Array (_ BitVec 32) ValueCell!6890)) (size!22183 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45418)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28015 0))(
  ( (Unit!28016) )
))
(declare-fun lt!368466 () Unit!28015)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!406 (array!45416 array!45418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24483 V!24483 V!24483 V!24483 (_ BitVec 32) Int) Unit!28015)

(assert (=> b!820115 (= lt!368466 (lemmaNoChangeToArrayThenSameMapNoExtras!406 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2296 (array!45416 array!45418 (_ BitVec 32) (_ BitVec 32) V!24483 V!24483 (_ BitVec 32) Int) ListLongMap!8507)

(assert (=> b!820115 (= lt!368461 (getCurrentListMapNoExtraKeys!2296 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820115 (= lt!368463 (getCurrentListMapNoExtraKeys!2296 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820116 () Bool)

(declare-fun res!559606 () Bool)

(assert (=> b!820116 (=> (not res!559606) (not e!455583))))

(declare-datatypes ((List!15508 0))(
  ( (Nil!15505) (Cons!15504 (h!16633 (_ BitVec 64)) (t!21839 List!15508)) )
))
(declare-fun arrayNoDuplicates!0 (array!45416 (_ BitVec 32) List!15508) Bool)

(assert (=> b!820116 (= res!559606 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15505))))

(declare-fun res!559610 () Bool)

(assert (=> start!70594 (=> (not res!559610) (not e!455583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70594 (= res!559610 (validMask!0 mask!1312))))

(assert (=> start!70594 e!455583))

(declare-fun tp_is_empty!14611 () Bool)

(assert (=> start!70594 tp_is_empty!14611))

(declare-fun array_inv!17395 (array!45416) Bool)

(assert (=> start!70594 (array_inv!17395 _keys!976)))

(assert (=> start!70594 true))

(declare-fun e!455582 () Bool)

(declare-fun array_inv!17396 (array!45418) Bool)

(assert (=> start!70594 (and (array_inv!17396 _values!788) e!455582)))

(assert (=> start!70594 tp!45439))

(declare-fun b!820117 () Bool)

(declare-fun res!559608 () Bool)

(assert (=> b!820117 (=> (not res!559608) (not e!455583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45416 (_ BitVec 32)) Bool)

(assert (=> b!820117 (= res!559608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun lt!368464 () ListLongMap!8507)

(declare-fun e!455578 () Bool)

(declare-fun b!820118 () Bool)

(declare-fun +!1864 (ListLongMap!8507 tuple2!9684) ListLongMap!8507)

(assert (=> b!820118 (= e!455578 (= lt!368464 (+!1864 lt!368461 (tuple2!9685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820119 () Bool)

(declare-fun e!455580 () Bool)

(assert (=> b!820119 (= e!455580 tp_is_empty!14611)))

(declare-fun b!820120 () Bool)

(assert (=> b!820120 (= e!455577 true)))

(declare-fun lt!368459 () tuple2!9684)

(declare-fun lt!368457 () tuple2!9684)

(declare-fun lt!368458 () ListLongMap!8507)

(assert (=> b!820120 (= lt!368458 (+!1864 (+!1864 lt!368461 lt!368459) lt!368457))))

(declare-fun lt!368460 () ListLongMap!8507)

(assert (=> b!820120 (= (+!1864 lt!368463 lt!368457) (+!1864 lt!368460 lt!368457))))

(declare-fun lt!368465 () Unit!28015)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!200 (ListLongMap!8507 (_ BitVec 64) V!24483 V!24483) Unit!28015)

(assert (=> b!820120 (= lt!368465 (addSameAsAddTwiceSameKeyDiffValues!200 lt!368463 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820120 (= lt!368457 (tuple2!9685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820120 e!455578))

(declare-fun res!559607 () Bool)

(assert (=> b!820120 (=> (not res!559607) (not e!455578))))

(declare-fun lt!368462 () ListLongMap!8507)

(assert (=> b!820120 (= res!559607 (= lt!368462 lt!368460))))

(assert (=> b!820120 (= lt!368460 (+!1864 lt!368463 lt!368459))))

(assert (=> b!820120 (= lt!368459 (tuple2!9685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2466 (array!45416 array!45418 (_ BitVec 32) (_ BitVec 32) V!24483 V!24483 (_ BitVec 32) Int) ListLongMap!8507)

(assert (=> b!820120 (= lt!368464 (getCurrentListMap!2466 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820120 (= lt!368462 (getCurrentListMap!2466 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820121 () Bool)

(declare-fun mapRes!23518 () Bool)

(assert (=> b!820121 (= e!455582 (and e!455580 mapRes!23518))))

(declare-fun condMapEmpty!23518 () Bool)

(declare-fun mapDefault!23518 () ValueCell!6890)

