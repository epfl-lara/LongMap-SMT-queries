; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37362 () Bool)

(assert start!37362)

(declare-fun b_free!8489 () Bool)

(declare-fun b_next!8489 () Bool)

(assert (=> start!37362 (= b_free!8489 (not b_next!8489))))

(declare-fun tp!30183 () Bool)

(declare-fun b_and!15731 () Bool)

(assert (=> start!37362 (= tp!30183 b_and!15731)))

(declare-fun res!215161 () Bool)

(declare-fun e!230866 () Bool)

(assert (=> start!37362 (=> (not res!215161) (not e!230866))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37362 (= res!215161 (validMask!0 mask!970))))

(assert (=> start!37362 e!230866))

(declare-datatypes ((V!13287 0))(
  ( (V!13288 (val!4613 Int)) )
))
(declare-datatypes ((ValueCell!4225 0))(
  ( (ValueCellFull!4225 (v!6810 V!13287)) (EmptyCell!4225) )
))
(declare-datatypes ((array!22195 0))(
  ( (array!22196 (arr!10566 (Array (_ BitVec 32) ValueCell!4225)) (size!10918 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22195)

(declare-fun e!230870 () Bool)

(declare-fun array_inv!7782 (array!22195) Bool)

(assert (=> start!37362 (and (array_inv!7782 _values!506) e!230870)))

(assert (=> start!37362 tp!30183))

(assert (=> start!37362 true))

(declare-fun tp_is_empty!9137 () Bool)

(assert (=> start!37362 tp_is_empty!9137))

(declare-datatypes ((array!22197 0))(
  ( (array!22198 (arr!10567 (Array (_ BitVec 32) (_ BitVec 64))) (size!10919 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22197)

(declare-fun array_inv!7783 (array!22197) Bool)

(assert (=> start!37362 (array_inv!7783 _keys!658)))

(declare-fun mapIsEmpty!15270 () Bool)

(declare-fun mapRes!15270 () Bool)

(assert (=> mapIsEmpty!15270 mapRes!15270))

(declare-fun b!379455 () Bool)

(declare-fun e!230865 () Bool)

(declare-fun e!230868 () Bool)

(assert (=> b!379455 (= e!230865 (not e!230868))))

(declare-fun res!215160 () Bool)

(assert (=> b!379455 (=> res!215160 e!230868)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379455 (= res!215160 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6172 0))(
  ( (tuple2!6173 (_1!3097 (_ BitVec 64)) (_2!3097 V!13287)) )
))
(declare-datatypes ((List!6008 0))(
  ( (Nil!6005) (Cons!6004 (h!6860 tuple2!6172) (t!11158 List!6008)) )
))
(declare-datatypes ((ListLongMap!5085 0))(
  ( (ListLongMap!5086 (toList!2558 List!6008)) )
))
(declare-fun lt!177201 () ListLongMap!5085)

(declare-fun zeroValue!472 () V!13287)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13287)

(declare-fun getCurrentListMap!1980 (array!22197 array!22195 (_ BitVec 32) (_ BitVec 32) V!13287 V!13287 (_ BitVec 32) Int) ListLongMap!5085)

(assert (=> b!379455 (= lt!177201 (getCurrentListMap!1980 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177200 () array!22197)

(declare-fun lt!177204 () ListLongMap!5085)

(declare-fun lt!177205 () array!22195)

(assert (=> b!379455 (= lt!177204 (getCurrentListMap!1980 lt!177200 lt!177205 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177210 () ListLongMap!5085)

(declare-fun lt!177202 () ListLongMap!5085)

(assert (=> b!379455 (and (= lt!177210 lt!177202) (= lt!177202 lt!177210))))

(declare-fun lt!177209 () ListLongMap!5085)

(declare-fun lt!177207 () tuple2!6172)

(declare-fun +!904 (ListLongMap!5085 tuple2!6172) ListLongMap!5085)

(assert (=> b!379455 (= lt!177202 (+!904 lt!177209 lt!177207))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13287)

(assert (=> b!379455 (= lt!177207 (tuple2!6173 k!778 v!373))))

(declare-datatypes ((Unit!11706 0))(
  ( (Unit!11707) )
))
(declare-fun lt!177198 () Unit!11706)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!138 (array!22197 array!22195 (_ BitVec 32) (_ BitVec 32) V!13287 V!13287 (_ BitVec 32) (_ BitVec 64) V!13287 (_ BitVec 32) Int) Unit!11706)

(assert (=> b!379455 (= lt!177198 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!138 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!814 (array!22197 array!22195 (_ BitVec 32) (_ BitVec 32) V!13287 V!13287 (_ BitVec 32) Int) ListLongMap!5085)

(assert (=> b!379455 (= lt!177210 (getCurrentListMapNoExtraKeys!814 lt!177200 lt!177205 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379455 (= lt!177205 (array!22196 (store (arr!10566 _values!506) i!548 (ValueCellFull!4225 v!373)) (size!10918 _values!506)))))

(assert (=> b!379455 (= lt!177209 (getCurrentListMapNoExtraKeys!814 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379456 () Bool)

(declare-fun res!215166 () Bool)

(assert (=> b!379456 (=> (not res!215166) (not e!230866))))

(assert (=> b!379456 (= res!215166 (or (= (select (arr!10567 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10567 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379457 () Bool)

(declare-fun e!230864 () Bool)

(assert (=> b!379457 (= e!230864 true)))

(declare-fun lt!177199 () ListLongMap!5085)

(declare-fun lt!177206 () ListLongMap!5085)

(assert (=> b!379457 (= lt!177199 (+!904 lt!177206 lt!177207))))

(declare-fun lt!177203 () Unit!11706)

(declare-fun addCommutativeForDiffKeys!303 (ListLongMap!5085 (_ BitVec 64) V!13287 (_ BitVec 64) V!13287) Unit!11706)

(assert (=> b!379457 (= lt!177203 (addCommutativeForDiffKeys!303 lt!177209 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379458 () Bool)

(declare-fun res!215164 () Bool)

(assert (=> b!379458 (=> (not res!215164) (not e!230866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22197 (_ BitVec 32)) Bool)

(assert (=> b!379458 (= res!215164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379459 () Bool)

(declare-fun res!215171 () Bool)

(assert (=> b!379459 (=> (not res!215171) (not e!230866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379459 (= res!215171 (validKeyInArray!0 k!778))))

(declare-fun b!379460 () Bool)

(declare-fun res!215167 () Bool)

(assert (=> b!379460 (=> (not res!215167) (not e!230866))))

(declare-datatypes ((List!6009 0))(
  ( (Nil!6006) (Cons!6005 (h!6861 (_ BitVec 64)) (t!11159 List!6009)) )
))
(declare-fun arrayNoDuplicates!0 (array!22197 (_ BitVec 32) List!6009) Bool)

(assert (=> b!379460 (= res!215167 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6006))))

(declare-fun b!379461 () Bool)

(declare-fun res!215169 () Bool)

(assert (=> b!379461 (=> (not res!215169) (not e!230866))))

(assert (=> b!379461 (= res!215169 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10919 _keys!658))))))

(declare-fun b!379462 () Bool)

(declare-fun res!215168 () Bool)

(assert (=> b!379462 (=> (not res!215168) (not e!230866))))

(assert (=> b!379462 (= res!215168 (and (= (size!10918 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10919 _keys!658) (size!10918 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15270 () Bool)

(declare-fun tp!30182 () Bool)

(declare-fun e!230869 () Bool)

(assert (=> mapNonEmpty!15270 (= mapRes!15270 (and tp!30182 e!230869))))

(declare-fun mapRest!15270 () (Array (_ BitVec 32) ValueCell!4225))

(declare-fun mapKey!15270 () (_ BitVec 32))

(declare-fun mapValue!15270 () ValueCell!4225)

(assert (=> mapNonEmpty!15270 (= (arr!10566 _values!506) (store mapRest!15270 mapKey!15270 mapValue!15270))))

(declare-fun b!379463 () Bool)

(declare-fun e!230867 () Bool)

(assert (=> b!379463 (= e!230867 tp_is_empty!9137)))

(declare-fun b!379464 () Bool)

(declare-fun res!215163 () Bool)

(assert (=> b!379464 (=> (not res!215163) (not e!230865))))

(assert (=> b!379464 (= res!215163 (arrayNoDuplicates!0 lt!177200 #b00000000000000000000000000000000 Nil!6006))))

(declare-fun b!379465 () Bool)

(assert (=> b!379465 (= e!230868 e!230864)))

(declare-fun res!215170 () Bool)

(assert (=> b!379465 (=> res!215170 e!230864)))

(assert (=> b!379465 (= res!215170 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379465 (= lt!177201 lt!177206)))

(declare-fun lt!177208 () tuple2!6172)

(assert (=> b!379465 (= lt!177206 (+!904 lt!177209 lt!177208))))

(assert (=> b!379465 (= lt!177204 lt!177199)))

(assert (=> b!379465 (= lt!177199 (+!904 lt!177202 lt!177208))))

(assert (=> b!379465 (= lt!177204 (+!904 lt!177210 lt!177208))))

(assert (=> b!379465 (= lt!177208 (tuple2!6173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379466 () Bool)

(declare-fun res!215165 () Bool)

(assert (=> b!379466 (=> (not res!215165) (not e!230866))))

(declare-fun arrayContainsKey!0 (array!22197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379466 (= res!215165 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!379467 () Bool)

(assert (=> b!379467 (= e!230870 (and e!230867 mapRes!15270))))

(declare-fun condMapEmpty!15270 () Bool)

(declare-fun mapDefault!15270 () ValueCell!4225)

