; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34728 () Bool)

(assert start!34728)

(declare-fun b_free!7535 () Bool)

(declare-fun b_next!7535 () Bool)

(assert (=> start!34728 (= b_free!7535 (not b_next!7535))))

(declare-fun tp!26169 () Bool)

(declare-fun b_and!14755 () Bool)

(assert (=> start!34728 (= tp!26169 b_and!14755)))

(declare-fun b!347243 () Bool)

(declare-fun e!212774 () Bool)

(declare-fun tp_is_empty!7487 () Bool)

(assert (=> b!347243 (= e!212774 tp_is_empty!7487)))

(declare-fun b!347244 () Bool)

(declare-fun res!192189 () Bool)

(declare-fun e!212773 () Bool)

(assert (=> b!347244 (=> (not res!192189) (not e!212773))))

(declare-datatypes ((array!18565 0))(
  ( (array!18566 (arr!8793 (Array (_ BitVec 32) (_ BitVec 64))) (size!9145 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18565)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18565 (_ BitVec 32)) Bool)

(assert (=> b!347244 (= res!192189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347245 () Bool)

(declare-fun e!212775 () Bool)

(assert (=> b!347245 (= e!212773 e!212775)))

(declare-fun res!192190 () Bool)

(assert (=> b!347245 (=> (not res!192190) (not e!212775))))

(declare-datatypes ((SeekEntryResult!3392 0))(
  ( (MissingZero!3392 (index!15747 (_ BitVec 32))) (Found!3392 (index!15748 (_ BitVec 32))) (Intermediate!3392 (undefined!4204 Bool) (index!15749 (_ BitVec 32)) (x!34590 (_ BitVec 32))) (Undefined!3392) (MissingVacant!3392 (index!15750 (_ BitVec 32))) )
))
(declare-fun lt!163515 () SeekEntryResult!3392)

(declare-fun k!1348 () (_ BitVec 64))

(assert (=> b!347245 (= res!192190 (and (is-Found!3392 lt!163515) (= (select (arr!8793 _keys!1895) (index!15748 lt!163515)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18565 (_ BitVec 32)) SeekEntryResult!3392)

(assert (=> b!347245 (= lt!163515 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!347246 () Bool)

(declare-fun res!192193 () Bool)

(assert (=> b!347246 (=> (not res!192193) (not e!212775))))

(declare-fun arrayContainsKey!0 (array!18565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347246 (= res!192193 (arrayContainsKey!0 _keys!1895 k!1348 (index!15748 lt!163515)))))

(declare-fun b!347247 () Bool)

(declare-fun res!192194 () Bool)

(assert (=> b!347247 (=> (not res!192194) (not e!212773))))

(declare-datatypes ((List!5104 0))(
  ( (Nil!5101) (Cons!5100 (h!5956 (_ BitVec 64)) (t!10232 List!5104)) )
))
(declare-fun arrayNoDuplicates!0 (array!18565 (_ BitVec 32) List!5104) Bool)

(assert (=> b!347247 (= res!192194 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5101))))

(declare-fun res!192187 () Bool)

(assert (=> start!34728 (=> (not res!192187) (not e!212773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34728 (= res!192187 (validMask!0 mask!2385))))

(assert (=> start!34728 e!212773))

(assert (=> start!34728 true))

(assert (=> start!34728 tp_is_empty!7487))

(assert (=> start!34728 tp!26169))

(declare-datatypes ((V!10959 0))(
  ( (V!10960 (val!3788 Int)) )
))
(declare-datatypes ((ValueCell!3400 0))(
  ( (ValueCellFull!3400 (v!5970 V!10959)) (EmptyCell!3400) )
))
(declare-datatypes ((array!18567 0))(
  ( (array!18568 (arr!8794 (Array (_ BitVec 32) ValueCell!3400)) (size!9146 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18567)

(declare-fun e!212776 () Bool)

(declare-fun array_inv!6510 (array!18567) Bool)

(assert (=> start!34728 (and (array_inv!6510 _values!1525) e!212776)))

(declare-fun array_inv!6511 (array!18565) Bool)

(assert (=> start!34728 (array_inv!6511 _keys!1895)))

(declare-fun b!347248 () Bool)

(declare-fun res!192188 () Bool)

(assert (=> b!347248 (=> (not res!192188) (not e!212773))))

(declare-fun zeroValue!1467 () V!10959)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10959)

(declare-datatypes ((tuple2!5484 0))(
  ( (tuple2!5485 (_1!2753 (_ BitVec 64)) (_2!2753 V!10959)) )
))
(declare-datatypes ((List!5105 0))(
  ( (Nil!5102) (Cons!5101 (h!5957 tuple2!5484) (t!10233 List!5105)) )
))
(declare-datatypes ((ListLongMap!4397 0))(
  ( (ListLongMap!4398 (toList!2214 List!5105)) )
))
(declare-fun contains!2278 (ListLongMap!4397 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1735 (array!18565 array!18567 (_ BitVec 32) (_ BitVec 32) V!10959 V!10959 (_ BitVec 32) Int) ListLongMap!4397)

(assert (=> b!347248 (= res!192188 (not (contains!2278 (getCurrentListMap!1735 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!347249 () Bool)

(assert (=> b!347249 (= e!212775 (not true))))

(assert (=> b!347249 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10781 0))(
  ( (Unit!10782) )
))
(declare-fun lt!163516 () Unit!10781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18565 (_ BitVec 64) (_ BitVec 32)) Unit!10781)

(assert (=> b!347249 (= lt!163516 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15748 lt!163515)))))

(declare-fun mapNonEmpty!12687 () Bool)

(declare-fun mapRes!12687 () Bool)

(declare-fun tp!26168 () Bool)

(declare-fun e!212778 () Bool)

(assert (=> mapNonEmpty!12687 (= mapRes!12687 (and tp!26168 e!212778))))

(declare-fun mapValue!12687 () ValueCell!3400)

(declare-fun mapKey!12687 () (_ BitVec 32))

(declare-fun mapRest!12687 () (Array (_ BitVec 32) ValueCell!3400))

(assert (=> mapNonEmpty!12687 (= (arr!8794 _values!1525) (store mapRest!12687 mapKey!12687 mapValue!12687))))

(declare-fun b!347250 () Bool)

(declare-fun res!192192 () Bool)

(assert (=> b!347250 (=> (not res!192192) (not e!212773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347250 (= res!192192 (validKeyInArray!0 k!1348))))

(declare-fun b!347251 () Bool)

(declare-fun res!192191 () Bool)

(assert (=> b!347251 (=> (not res!192191) (not e!212773))))

(assert (=> b!347251 (= res!192191 (and (= (size!9146 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9145 _keys!1895) (size!9146 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347252 () Bool)

(assert (=> b!347252 (= e!212776 (and e!212774 mapRes!12687))))

(declare-fun condMapEmpty!12687 () Bool)

(declare-fun mapDefault!12687 () ValueCell!3400)

