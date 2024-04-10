; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20674 () Bool)

(assert start!20674)

(declare-fun b_free!5333 () Bool)

(declare-fun b_next!5333 () Bool)

(assert (=> start!20674 (= b_free!5333 (not b_next!5333))))

(declare-fun tp!19030 () Bool)

(declare-fun b_and!12079 () Bool)

(assert (=> start!20674 (= tp!19030 b_and!12079)))

(declare-fun b!206606 () Bool)

(declare-fun res!100129 () Bool)

(declare-fun e!135011 () Bool)

(assert (=> b!206606 (=> (not res!100129) (not e!135011))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9589 0))(
  ( (array!9590 (arr!4545 (Array (_ BitVec 32) (_ BitVec 64))) (size!4870 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9589)

(assert (=> b!206606 (= res!100129 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4870 _keys!825))))))

(declare-fun b!206607 () Bool)

(declare-fun res!100127 () Bool)

(assert (=> b!206607 (=> (not res!100127) (not e!135011))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((V!6565 0))(
  ( (V!6566 (val!2639 Int)) )
))
(declare-datatypes ((ValueCell!2251 0))(
  ( (ValueCellFull!2251 (v!4609 V!6565)) (EmptyCell!2251) )
))
(declare-datatypes ((array!9591 0))(
  ( (array!9592 (arr!4546 (Array (_ BitVec 32) ValueCell!2251)) (size!4871 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9591)

(assert (=> b!206607 (= res!100127 (and (= (size!4871 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4870 _keys!825) (size!4871 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206608 () Bool)

(declare-fun res!100128 () Bool)

(assert (=> b!206608 (=> (not res!100128) (not e!135011))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206608 (= res!100128 (validKeyInArray!0 k!843))))

(declare-fun b!206610 () Bool)

(declare-fun e!135012 () Bool)

(declare-fun e!135013 () Bool)

(declare-fun mapRes!8852 () Bool)

(assert (=> b!206610 (= e!135012 (and e!135013 mapRes!8852))))

(declare-fun condMapEmpty!8852 () Bool)

(declare-fun mapDefault!8852 () ValueCell!2251)

