; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36984 () Bool)

(assert start!36984)

(declare-fun b_free!8111 () Bool)

(declare-fun b_next!8111 () Bool)

(assert (=> start!36984 (= b_free!8111 (not b_next!8111))))

(declare-fun tp!29048 () Bool)

(declare-fun b_and!15353 () Bool)

(assert (=> start!36984 (= tp!29048 b_and!15353)))

(declare-fun b!371204 () Bool)

(declare-fun res!208615 () Bool)

(declare-fun e!226612 () Bool)

(assert (=> b!371204 (=> (not res!208615) (not e!226612))))

(declare-datatypes ((array!21461 0))(
  ( (array!21462 (arr!10199 (Array (_ BitVec 32) (_ BitVec 64))) (size!10551 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21461)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371204 (= res!208615 (or (= (select (arr!10199 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10199 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371205 () Bool)

(declare-fun res!208617 () Bool)

(assert (=> b!371205 (=> (not res!208617) (not e!226612))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371205 (= res!208617 (validKeyInArray!0 k!778))))

(declare-fun b!371206 () Bool)

(declare-fun res!208610 () Bool)

(assert (=> b!371206 (=> (not res!208610) (not e!226612))))

(declare-fun arrayContainsKey!0 (array!21461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371206 (= res!208610 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!371207 () Bool)

(declare-fun res!208614 () Bool)

(assert (=> b!371207 (=> (not res!208614) (not e!226612))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21461 (_ BitVec 32)) Bool)

(assert (=> b!371207 (= res!208614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371208 () Bool)

(declare-fun res!208618 () Bool)

(assert (=> b!371208 (=> (not res!208618) (not e!226612))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12783 0))(
  ( (V!12784 (val!4424 Int)) )
))
(declare-datatypes ((ValueCell!4036 0))(
  ( (ValueCellFull!4036 (v!6621 V!12783)) (EmptyCell!4036) )
))
(declare-datatypes ((array!21463 0))(
  ( (array!21464 (arr!10200 (Array (_ BitVec 32) ValueCell!4036)) (size!10552 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21463)

(assert (=> b!371208 (= res!208618 (and (= (size!10552 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10551 _keys!658) (size!10552 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371209 () Bool)

(declare-fun res!208616 () Bool)

(assert (=> b!371209 (=> (not res!208616) (not e!226612))))

(assert (=> b!371209 (= res!208616 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10551 _keys!658))))))

(declare-fun b!371210 () Bool)

(declare-fun e!226611 () Bool)

(assert (=> b!371210 (= e!226612 e!226611)))

(declare-fun res!208612 () Bool)

(assert (=> b!371210 (=> (not res!208612) (not e!226611))))

(declare-fun lt!170198 () array!21461)

(assert (=> b!371210 (= res!208612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170198 mask!970))))

(assert (=> b!371210 (= lt!170198 (array!21462 (store (arr!10199 _keys!658) i!548 k!778) (size!10551 _keys!658)))))

(declare-fun res!208611 () Bool)

(assert (=> start!36984 (=> (not res!208611) (not e!226612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36984 (= res!208611 (validMask!0 mask!970))))

(assert (=> start!36984 e!226612))

(declare-fun e!226608 () Bool)

(declare-fun array_inv!7532 (array!21463) Bool)

(assert (=> start!36984 (and (array_inv!7532 _values!506) e!226608)))

(assert (=> start!36984 tp!29048))

(assert (=> start!36984 true))

(declare-fun tp_is_empty!8759 () Bool)

(assert (=> start!36984 tp_is_empty!8759))

(declare-fun array_inv!7533 (array!21461) Bool)

(assert (=> start!36984 (array_inv!7533 _keys!658)))

(declare-fun b!371211 () Bool)

(declare-fun e!226609 () Bool)

(assert (=> b!371211 (= e!226609 tp_is_empty!8759)))

(declare-fun mapNonEmpty!14703 () Bool)

(declare-fun mapRes!14703 () Bool)

(declare-fun tp!29049 () Bool)

(declare-fun e!226613 () Bool)

(assert (=> mapNonEmpty!14703 (= mapRes!14703 (and tp!29049 e!226613))))

(declare-fun mapKey!14703 () (_ BitVec 32))

(declare-fun mapRest!14703 () (Array (_ BitVec 32) ValueCell!4036))

(declare-fun mapValue!14703 () ValueCell!4036)

(assert (=> mapNonEmpty!14703 (= (arr!10200 _values!506) (store mapRest!14703 mapKey!14703 mapValue!14703))))

(declare-fun b!371212 () Bool)

(declare-fun res!208613 () Bool)

(assert (=> b!371212 (=> (not res!208613) (not e!226611))))

(declare-datatypes ((List!5709 0))(
  ( (Nil!5706) (Cons!5705 (h!6561 (_ BitVec 64)) (t!10859 List!5709)) )
))
(declare-fun arrayNoDuplicates!0 (array!21461 (_ BitVec 32) List!5709) Bool)

(assert (=> b!371212 (= res!208613 (arrayNoDuplicates!0 lt!170198 #b00000000000000000000000000000000 Nil!5706))))

(declare-fun b!371213 () Bool)

(assert (=> b!371213 (= e!226613 tp_is_empty!8759)))

(declare-fun b!371214 () Bool)

(assert (=> b!371214 (= e!226611 (not true))))

(declare-datatypes ((tuple2!5870 0))(
  ( (tuple2!5871 (_1!2946 (_ BitVec 64)) (_2!2946 V!12783)) )
))
(declare-datatypes ((List!5710 0))(
  ( (Nil!5707) (Cons!5706 (h!6562 tuple2!5870) (t!10860 List!5710)) )
))
(declare-datatypes ((ListLongMap!4783 0))(
  ( (ListLongMap!4784 (toList!2407 List!5710)) )
))
(declare-fun lt!170197 () ListLongMap!4783)

(declare-fun lt!170196 () ListLongMap!4783)

(assert (=> b!371214 (and (= lt!170197 lt!170196) (= lt!170196 lt!170197))))

(declare-fun lt!170195 () ListLongMap!4783)

(declare-fun v!373 () V!12783)

(declare-fun +!753 (ListLongMap!4783 tuple2!5870) ListLongMap!4783)

(assert (=> b!371214 (= lt!170196 (+!753 lt!170195 (tuple2!5871 k!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12783)

(declare-datatypes ((Unit!11412 0))(
  ( (Unit!11413) )
))
(declare-fun lt!170199 () Unit!11412)

(declare-fun minValue!472 () V!12783)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!8 (array!21461 array!21463 (_ BitVec 32) (_ BitVec 32) V!12783 V!12783 (_ BitVec 32) (_ BitVec 64) V!12783 (_ BitVec 32) Int) Unit!11412)

(assert (=> b!371214 (= lt!170199 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!8 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!684 (array!21461 array!21463 (_ BitVec 32) (_ BitVec 32) V!12783 V!12783 (_ BitVec 32) Int) ListLongMap!4783)

(assert (=> b!371214 (= lt!170197 (getCurrentListMapNoExtraKeys!684 lt!170198 (array!21464 (store (arr!10200 _values!506) i!548 (ValueCellFull!4036 v!373)) (size!10552 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371214 (= lt!170195 (getCurrentListMapNoExtraKeys!684 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14703 () Bool)

(assert (=> mapIsEmpty!14703 mapRes!14703))

(declare-fun b!371215 () Bool)

(assert (=> b!371215 (= e!226608 (and e!226609 mapRes!14703))))

(declare-fun condMapEmpty!14703 () Bool)

(declare-fun mapDefault!14703 () ValueCell!4036)

