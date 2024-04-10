; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40658 () Bool)

(assert start!40658)

(declare-fun b_free!10669 () Bool)

(declare-fun b_next!10669 () Bool)

(assert (=> start!40658 (= b_free!10669 (not b_next!10669))))

(declare-fun tp!37827 () Bool)

(declare-fun b_and!18677 () Bool)

(assert (=> start!40658 (= tp!37827 b_and!18677)))

(declare-fun b!449222 () Bool)

(declare-fun res!267161 () Bool)

(declare-fun e!263440 () Bool)

(assert (=> b!449222 (=> (not res!267161) (not e!263440))))

(declare-datatypes ((array!27821 0))(
  ( (array!27822 (arr!13356 (Array (_ BitVec 32) (_ BitVec 64))) (size!13708 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27821)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17115 0))(
  ( (V!17116 (val!6048 Int)) )
))
(declare-datatypes ((ValueCell!5660 0))(
  ( (ValueCellFull!5660 (v!8303 V!17115)) (EmptyCell!5660) )
))
(declare-datatypes ((array!27823 0))(
  ( (array!27824 (arr!13357 (Array (_ BitVec 32) ValueCell!5660)) (size!13709 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27823)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!449222 (= res!267161 (and (= (size!13709 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13708 _keys!709) (size!13709 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449223 () Bool)

(declare-fun res!267165 () Bool)

(assert (=> b!449223 (=> (not res!267165) (not e!263440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27821 (_ BitVec 32)) Bool)

(assert (=> b!449223 (= res!267165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449224 () Bool)

(declare-fun e!263441 () Bool)

(declare-fun tp_is_empty!12007 () Bool)

(assert (=> b!449224 (= e!263441 tp_is_empty!12007)))

(declare-fun b!449225 () Bool)

(declare-fun res!267169 () Bool)

(assert (=> b!449225 (=> (not res!267169) (not e!263440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449225 (= res!267169 (validMask!0 mask!1025))))

(declare-fun b!449226 () Bool)

(declare-fun e!263444 () Bool)

(assert (=> b!449226 (= e!263440 e!263444)))

(declare-fun res!267170 () Bool)

(assert (=> b!449226 (=> (not res!267170) (not e!263444))))

(declare-fun lt!204323 () array!27821)

(assert (=> b!449226 (= res!267170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204323 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449226 (= lt!204323 (array!27822 (store (arr!13356 _keys!709) i!563 k!794) (size!13708 _keys!709)))))

(declare-fun mapIsEmpty!19644 () Bool)

(declare-fun mapRes!19644 () Bool)

(assert (=> mapIsEmpty!19644 mapRes!19644))

(declare-fun b!449227 () Bool)

(declare-fun res!267163 () Bool)

(assert (=> b!449227 (=> (not res!267163) (not e!263440))))

(declare-fun arrayContainsKey!0 (array!27821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449227 (= res!267163 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!449228 () Bool)

(declare-fun e!263443 () Bool)

(assert (=> b!449228 (= e!263443 tp_is_empty!12007)))

(declare-fun res!267162 () Bool)

(assert (=> start!40658 (=> (not res!267162) (not e!263440))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40658 (= res!267162 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13708 _keys!709))))))

(assert (=> start!40658 e!263440))

(assert (=> start!40658 tp_is_empty!12007))

(assert (=> start!40658 tp!37827))

(assert (=> start!40658 true))

(declare-fun e!263439 () Bool)

(declare-fun array_inv!9680 (array!27823) Bool)

(assert (=> start!40658 (and (array_inv!9680 _values!549) e!263439)))

(declare-fun array_inv!9681 (array!27821) Bool)

(assert (=> start!40658 (array_inv!9681 _keys!709)))

(declare-fun b!449229 () Bool)

(declare-fun res!267167 () Bool)

(assert (=> b!449229 (=> (not res!267167) (not e!263444))))

(declare-datatypes ((List!8005 0))(
  ( (Nil!8002) (Cons!8001 (h!8857 (_ BitVec 64)) (t!13767 List!8005)) )
))
(declare-fun arrayNoDuplicates!0 (array!27821 (_ BitVec 32) List!8005) Bool)

(assert (=> b!449229 (= res!267167 (arrayNoDuplicates!0 lt!204323 #b00000000000000000000000000000000 Nil!8002))))

(declare-fun b!449230 () Bool)

(declare-fun res!267164 () Bool)

(assert (=> b!449230 (=> (not res!267164) (not e!263440))))

(assert (=> b!449230 (= res!267164 (or (= (select (arr!13356 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13356 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449231 () Bool)

(declare-fun res!267166 () Bool)

(assert (=> b!449231 (=> (not res!267166) (not e!263444))))

(assert (=> b!449231 (= res!267166 (bvsle from!863 i!563))))

(declare-fun b!449232 () Bool)

(declare-fun res!267160 () Bool)

(assert (=> b!449232 (=> (not res!267160) (not e!263440))))

(assert (=> b!449232 (= res!267160 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13708 _keys!709))))))

(declare-fun b!449233 () Bool)

(assert (=> b!449233 (= e!263444 false)))

(declare-fun minValue!515 () V!17115)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17115)

(declare-datatypes ((tuple2!7940 0))(
  ( (tuple2!7941 (_1!3981 (_ BitVec 64)) (_2!3981 V!17115)) )
))
(declare-datatypes ((List!8006 0))(
  ( (Nil!8003) (Cons!8002 (h!8858 tuple2!7940) (t!13768 List!8006)) )
))
(declare-datatypes ((ListLongMap!6853 0))(
  ( (ListLongMap!6854 (toList!3442 List!8006)) )
))
(declare-fun lt!204322 () ListLongMap!6853)

(declare-fun v!412 () V!17115)

(declare-fun getCurrentListMapNoExtraKeys!1628 (array!27821 array!27823 (_ BitVec 32) (_ BitVec 32) V!17115 V!17115 (_ BitVec 32) Int) ListLongMap!6853)

(assert (=> b!449233 (= lt!204322 (getCurrentListMapNoExtraKeys!1628 lt!204323 (array!27824 (store (arr!13357 _values!549) i!563 (ValueCellFull!5660 v!412)) (size!13709 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204324 () ListLongMap!6853)

(assert (=> b!449233 (= lt!204324 (getCurrentListMapNoExtraKeys!1628 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449234 () Bool)

(declare-fun res!267171 () Bool)

(assert (=> b!449234 (=> (not res!267171) (not e!263440))))

(assert (=> b!449234 (= res!267171 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8002))))

(declare-fun b!449235 () Bool)

(declare-fun res!267168 () Bool)

(assert (=> b!449235 (=> (not res!267168) (not e!263440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449235 (= res!267168 (validKeyInArray!0 k!794))))

(declare-fun b!449236 () Bool)

(assert (=> b!449236 (= e!263439 (and e!263441 mapRes!19644))))

(declare-fun condMapEmpty!19644 () Bool)

(declare-fun mapDefault!19644 () ValueCell!5660)

