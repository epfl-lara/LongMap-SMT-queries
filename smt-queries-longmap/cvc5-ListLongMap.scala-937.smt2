; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20718 () Bool)

(assert start!20718)

(declare-fun b_free!5377 () Bool)

(declare-fun b_next!5377 () Bool)

(assert (=> start!20718 (= b_free!5377 (not b_next!5377))))

(declare-fun tp!19163 () Bool)

(declare-fun b_and!12123 () Bool)

(assert (=> start!20718 (= tp!19163 b_and!12123)))

(declare-fun mapNonEmpty!8918 () Bool)

(declare-fun mapRes!8918 () Bool)

(declare-fun tp!19162 () Bool)

(declare-fun e!135343 () Bool)

(assert (=> mapNonEmpty!8918 (= mapRes!8918 (and tp!19162 e!135343))))

(declare-datatypes ((V!6625 0))(
  ( (V!6626 (val!2661 Int)) )
))
(declare-datatypes ((ValueCell!2273 0))(
  ( (ValueCellFull!2273 (v!4631 V!6625)) (EmptyCell!2273) )
))
(declare-fun mapRest!8918 () (Array (_ BitVec 32) ValueCell!2273))

(declare-fun mapKey!8918 () (_ BitVec 32))

(declare-datatypes ((array!9675 0))(
  ( (array!9676 (arr!4588 (Array (_ BitVec 32) ValueCell!2273)) (size!4913 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9675)

(declare-fun mapValue!8918 () ValueCell!2273)

(assert (=> mapNonEmpty!8918 (= (arr!4588 _values!649) (store mapRest!8918 mapKey!8918 mapValue!8918))))

(declare-fun b!207266 () Bool)

(declare-fun res!100591 () Bool)

(declare-fun e!135340 () Bool)

(assert (=> b!207266 (=> (not res!100591) (not e!135340))))

(declare-datatypes ((array!9677 0))(
  ( (array!9678 (arr!4589 (Array (_ BitVec 32) (_ BitVec 64))) (size!4914 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9677)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207266 (= res!100591 (and (= (size!4913 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4914 _keys!825) (size!4913 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207268 () Bool)

(declare-fun tp_is_empty!5233 () Bool)

(assert (=> b!207268 (= e!135343 tp_is_empty!5233)))

(declare-fun mapIsEmpty!8918 () Bool)

(assert (=> mapIsEmpty!8918 mapRes!8918))

(declare-fun b!207269 () Bool)

(declare-fun res!100585 () Bool)

(assert (=> b!207269 (=> (not res!100585) (not e!135340))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207269 (= res!100585 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4914 _keys!825))))))

(declare-fun b!207270 () Bool)

(declare-fun e!135341 () Bool)

(declare-fun e!135344 () Bool)

(assert (=> b!207270 (= e!135341 (and e!135344 mapRes!8918))))

(declare-fun condMapEmpty!8918 () Bool)

(declare-fun mapDefault!8918 () ValueCell!2273)

