; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36828 () Bool)

(assert start!36828)

(declare-fun b_free!7955 () Bool)

(declare-fun b_next!7955 () Bool)

(assert (=> start!36828 (= b_free!7955 (not b_next!7955))))

(declare-fun tp!28581 () Bool)

(declare-fun b_and!15197 () Bool)

(assert (=> start!36828 (= tp!28581 b_and!15197)))

(declare-fun b!368162 () Bool)

(declare-fun res!206273 () Bool)

(declare-fun e!225205 () Bool)

(assert (=> b!368162 (=> (not res!206273) (not e!225205))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21163 0))(
  ( (array!21164 (arr!10050 (Array (_ BitVec 32) (_ BitVec 64))) (size!10402 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21163)

(assert (=> b!368162 (= res!206273 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10402 _keys!658))))))

(declare-fun b!368163 () Bool)

(declare-fun res!206277 () Bool)

(assert (=> b!368163 (=> (not res!206277) (not e!225205))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368163 (= res!206277 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!368164 () Bool)

(declare-fun e!225208 () Bool)

(assert (=> b!368164 (= e!225205 e!225208)))

(declare-fun res!206279 () Bool)

(assert (=> b!368164 (=> (not res!206279) (not e!225208))))

(declare-fun lt!169487 () array!21163)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21163 (_ BitVec 32)) Bool)

(assert (=> b!368164 (= res!206279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169487 mask!970))))

(assert (=> b!368164 (= lt!169487 (array!21164 (store (arr!10050 _keys!658) i!548 k!778) (size!10402 _keys!658)))))

(declare-fun b!368165 () Bool)

(declare-fun res!206276 () Bool)

(assert (=> b!368165 (=> (not res!206276) (not e!225205))))

(assert (=> b!368165 (= res!206276 (or (= (select (arr!10050 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10050 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!206275 () Bool)

(assert (=> start!36828 (=> (not res!206275) (not e!225205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36828 (= res!206275 (validMask!0 mask!970))))

(assert (=> start!36828 e!225205))

(assert (=> start!36828 true))

(declare-datatypes ((V!12575 0))(
  ( (V!12576 (val!4346 Int)) )
))
(declare-datatypes ((ValueCell!3958 0))(
  ( (ValueCellFull!3958 (v!6543 V!12575)) (EmptyCell!3958) )
))
(declare-datatypes ((array!21165 0))(
  ( (array!21166 (arr!10051 (Array (_ BitVec 32) ValueCell!3958)) (size!10403 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21165)

(declare-fun e!225204 () Bool)

(declare-fun array_inv!7430 (array!21165) Bool)

(assert (=> start!36828 (and (array_inv!7430 _values!506) e!225204)))

(assert (=> start!36828 tp!28581))

(declare-fun tp_is_empty!8603 () Bool)

(assert (=> start!36828 tp_is_empty!8603))

(declare-fun array_inv!7431 (array!21163) Bool)

(assert (=> start!36828 (array_inv!7431 _keys!658)))

(declare-fun b!368166 () Bool)

(declare-fun res!206278 () Bool)

(assert (=> b!368166 (=> (not res!206278) (not e!225205))))

(assert (=> b!368166 (= res!206278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368167 () Bool)

(assert (=> b!368167 (= e!225208 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12575)

(declare-datatypes ((tuple2!5756 0))(
  ( (tuple2!5757 (_1!2889 (_ BitVec 64)) (_2!2889 V!12575)) )
))
(declare-datatypes ((List!5588 0))(
  ( (Nil!5585) (Cons!5584 (h!6440 tuple2!5756) (t!10738 List!5588)) )
))
(declare-datatypes ((ListLongMap!4669 0))(
  ( (ListLongMap!4670 (toList!2350 List!5588)) )
))
(declare-fun lt!169488 () ListLongMap!4669)

(declare-fun minValue!472 () V!12575)

(declare-fun getCurrentListMapNoExtraKeys!627 (array!21163 array!21165 (_ BitVec 32) (_ BitVec 32) V!12575 V!12575 (_ BitVec 32) Int) ListLongMap!4669)

(assert (=> b!368167 (= lt!169488 (getCurrentListMapNoExtraKeys!627 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14469 () Bool)

(declare-fun mapRes!14469 () Bool)

(assert (=> mapIsEmpty!14469 mapRes!14469))

(declare-fun b!368168 () Bool)

(declare-fun res!206270 () Bool)

(assert (=> b!368168 (=> (not res!206270) (not e!225205))))

(declare-datatypes ((List!5589 0))(
  ( (Nil!5586) (Cons!5585 (h!6441 (_ BitVec 64)) (t!10739 List!5589)) )
))
(declare-fun arrayNoDuplicates!0 (array!21163 (_ BitVec 32) List!5589) Bool)

(assert (=> b!368168 (= res!206270 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5586))))

(declare-fun b!368169 () Bool)

(declare-fun res!206271 () Bool)

(assert (=> b!368169 (=> (not res!206271) (not e!225205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368169 (= res!206271 (validKeyInArray!0 k!778))))

(declare-fun b!368170 () Bool)

(declare-fun e!225206 () Bool)

(assert (=> b!368170 (= e!225206 tp_is_empty!8603)))

(declare-fun b!368171 () Bool)

(declare-fun e!225207 () Bool)

(assert (=> b!368171 (= e!225207 tp_is_empty!8603)))

(declare-fun b!368172 () Bool)

(declare-fun res!206272 () Bool)

(assert (=> b!368172 (=> (not res!206272) (not e!225205))))

(assert (=> b!368172 (= res!206272 (and (= (size!10403 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10402 _keys!658) (size!10403 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14469 () Bool)

(declare-fun tp!28580 () Bool)

(assert (=> mapNonEmpty!14469 (= mapRes!14469 (and tp!28580 e!225206))))

(declare-fun mapKey!14469 () (_ BitVec 32))

(declare-fun mapValue!14469 () ValueCell!3958)

(declare-fun mapRest!14469 () (Array (_ BitVec 32) ValueCell!3958))

(assert (=> mapNonEmpty!14469 (= (arr!10051 _values!506) (store mapRest!14469 mapKey!14469 mapValue!14469))))

(declare-fun b!368173 () Bool)

(declare-fun res!206274 () Bool)

(assert (=> b!368173 (=> (not res!206274) (not e!225208))))

(assert (=> b!368173 (= res!206274 (arrayNoDuplicates!0 lt!169487 #b00000000000000000000000000000000 Nil!5586))))

(declare-fun b!368174 () Bool)

(assert (=> b!368174 (= e!225204 (and e!225207 mapRes!14469))))

(declare-fun condMapEmpty!14469 () Bool)

(declare-fun mapDefault!14469 () ValueCell!3958)

