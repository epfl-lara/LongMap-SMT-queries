; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34304 () Bool)

(assert start!34304)

(declare-fun b_free!7279 () Bool)

(declare-fun b_next!7279 () Bool)

(assert (=> start!34304 (= b_free!7279 (not b_next!7279))))

(declare-fun tp!25377 () Bool)

(declare-fun b_and!14483 () Bool)

(assert (=> start!34304 (= tp!25377 b_and!14483)))

(declare-fun b!342263 () Bool)

(declare-fun e!209894 () Bool)

(declare-fun tp_is_empty!7231 () Bool)

(assert (=> b!342263 (= e!209894 tp_is_empty!7231)))

(declare-fun b!342265 () Bool)

(declare-datatypes ((Unit!10646 0))(
  ( (Unit!10647) )
))
(declare-fun e!209890 () Unit!10646)

(declare-fun Unit!10648 () Unit!10646)

(assert (=> b!342265 (= e!209890 Unit!10648)))

(declare-fun b!342266 () Bool)

(declare-fun e!209895 () Bool)

(declare-fun e!209893 () Bool)

(assert (=> b!342266 (= e!209895 e!209893)))

(declare-fun res!189187 () Bool)

(assert (=> b!342266 (=> (not res!189187) (not e!209893))))

(declare-datatypes ((SeekEntryResult!3299 0))(
  ( (MissingZero!3299 (index!15375 (_ BitVec 32))) (Found!3299 (index!15376 (_ BitVec 32))) (Intermediate!3299 (undefined!4111 Bool) (index!15377 (_ BitVec 32)) (x!34081 (_ BitVec 32))) (Undefined!3299) (MissingVacant!3299 (index!15378 (_ BitVec 32))) )
))
(declare-fun lt!162104 () SeekEntryResult!3299)

(assert (=> b!342266 (= res!189187 (and (not (is-Found!3299 lt!162104)) (not (is-MissingZero!3299 lt!162104)) (is-MissingVacant!3299 lt!162104)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18059 0))(
  ( (array!18060 (arr!8548 (Array (_ BitVec 32) (_ BitVec 64))) (size!8900 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18059)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18059 (_ BitVec 32)) SeekEntryResult!3299)

(assert (=> b!342266 (= lt!162104 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!342267 () Bool)

(declare-fun res!189186 () Bool)

(assert (=> b!342267 (=> (not res!189186) (not e!209895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18059 (_ BitVec 32)) Bool)

(assert (=> b!342267 (= res!189186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342268 () Bool)

(declare-fun res!189190 () Bool)

(assert (=> b!342268 (=> (not res!189190) (not e!209895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342268 (= res!189190 (validKeyInArray!0 k!1348))))

(declare-fun b!342269 () Bool)

(declare-fun res!189189 () Bool)

(assert (=> b!342269 (=> (not res!189189) (not e!209895))))

(declare-datatypes ((V!10619 0))(
  ( (V!10620 (val!3660 Int)) )
))
(declare-datatypes ((ValueCell!3272 0))(
  ( (ValueCellFull!3272 (v!5834 V!10619)) (EmptyCell!3272) )
))
(declare-datatypes ((array!18061 0))(
  ( (array!18062 (arr!8549 (Array (_ BitVec 32) ValueCell!3272)) (size!8901 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18061)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342269 (= res!189189 (and (= (size!8901 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8900 _keys!1895) (size!8901 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342270 () Bool)

(declare-fun res!189191 () Bool)

(assert (=> b!342270 (=> (not res!189191) (not e!209895))))

(declare-fun zeroValue!1467 () V!10619)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10619)

(declare-datatypes ((tuple2!5306 0))(
  ( (tuple2!5307 (_1!2664 (_ BitVec 64)) (_2!2664 V!10619)) )
))
(declare-datatypes ((List!4923 0))(
  ( (Nil!4920) (Cons!4919 (h!5775 tuple2!5306) (t!10035 List!4923)) )
))
(declare-datatypes ((ListLongMap!4219 0))(
  ( (ListLongMap!4220 (toList!2125 List!4923)) )
))
(declare-fun contains!2181 (ListLongMap!4219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1646 (array!18059 array!18061 (_ BitVec 32) (_ BitVec 32) V!10619 V!10619 (_ BitVec 32) Int) ListLongMap!4219)

(assert (=> b!342270 (= res!189191 (not (contains!2181 (getCurrentListMap!1646 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!342264 () Bool)

(assert (=> b!342264 (= e!209893 false)))

(declare-fun lt!162106 () Unit!10646)

(assert (=> b!342264 (= lt!162106 e!209890)))

(declare-fun c!52800 () Bool)

(declare-fun arrayContainsKey!0 (array!18059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342264 (= c!52800 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun res!189188 () Bool)

(assert (=> start!34304 (=> (not res!189188) (not e!209895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34304 (= res!189188 (validMask!0 mask!2385))))

(assert (=> start!34304 e!209895))

(assert (=> start!34304 true))

(assert (=> start!34304 tp_is_empty!7231))

(assert (=> start!34304 tp!25377))

(declare-fun e!209892 () Bool)

(declare-fun array_inv!6330 (array!18061) Bool)

(assert (=> start!34304 (and (array_inv!6330 _values!1525) e!209892)))

(declare-fun array_inv!6331 (array!18059) Bool)

(assert (=> start!34304 (array_inv!6331 _keys!1895)))

(declare-fun mapNonEmpty!12279 () Bool)

(declare-fun mapRes!12279 () Bool)

(declare-fun tp!25376 () Bool)

(assert (=> mapNonEmpty!12279 (= mapRes!12279 (and tp!25376 e!209894))))

(declare-fun mapRest!12279 () (Array (_ BitVec 32) ValueCell!3272))

(declare-fun mapKey!12279 () (_ BitVec 32))

(declare-fun mapValue!12279 () ValueCell!3272)

(assert (=> mapNonEmpty!12279 (= (arr!8549 _values!1525) (store mapRest!12279 mapKey!12279 mapValue!12279))))

(declare-fun b!342271 () Bool)

(declare-fun res!189185 () Bool)

(assert (=> b!342271 (=> (not res!189185) (not e!209895))))

(declare-datatypes ((List!4924 0))(
  ( (Nil!4921) (Cons!4920 (h!5776 (_ BitVec 64)) (t!10036 List!4924)) )
))
(declare-fun arrayNoDuplicates!0 (array!18059 (_ BitVec 32) List!4924) Bool)

(assert (=> b!342271 (= res!189185 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4921))))

(declare-fun b!342272 () Bool)

(declare-fun e!209889 () Bool)

(assert (=> b!342272 (= e!209892 (and e!209889 mapRes!12279))))

(declare-fun condMapEmpty!12279 () Bool)

(declare-fun mapDefault!12279 () ValueCell!3272)

