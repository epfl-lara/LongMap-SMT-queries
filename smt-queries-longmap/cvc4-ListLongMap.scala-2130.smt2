; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36022 () Bool)

(assert start!36022)

(declare-fun res!201275 () Bool)

(declare-fun e!221580 () Bool)

(assert (=> start!36022 (=> (not res!201275) (not e!221580))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36022 (= res!201275 (validMask!0 mask!1943))))

(assert (=> start!36022 e!221580))

(assert (=> start!36022 true))

(declare-datatypes ((array!20363 0))(
  ( (array!20364 (arr!9668 (Array (_ BitVec 32) (_ BitVec 64))) (size!10020 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20363)

(declare-fun array_inv!7112 (array!20363) Bool)

(assert (=> start!36022 (array_inv!7112 _keys!1541)))

(declare-datatypes ((V!12183 0))(
  ( (V!12184 (val!4247 Int)) )
))
(declare-datatypes ((ValueCell!3859 0))(
  ( (ValueCellFull!3859 (v!6442 V!12183)) (EmptyCell!3859) )
))
(declare-datatypes ((array!20365 0))(
  ( (array!20366 (arr!9669 (Array (_ BitVec 32) ValueCell!3859)) (size!10021 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20365)

(declare-fun e!221582 () Bool)

(declare-fun array_inv!7113 (array!20365) Bool)

(assert (=> start!36022 (and (array_inv!7113 _values!1277) e!221582)))

(declare-fun b!361796 () Bool)

(declare-fun e!221583 () Bool)

(declare-fun tp_is_empty!8405 () Bool)

(assert (=> b!361796 (= e!221583 tp_is_empty!8405)))

(declare-fun b!361797 () Bool)

(declare-fun res!201274 () Bool)

(assert (=> b!361797 (=> (not res!201274) (not e!221580))))

(declare-fun from!1924 () (_ BitVec 32))

(assert (=> b!361797 (= res!201274 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10020 _keys!1541))))))

(declare-fun b!361798 () Bool)

(declare-fun k!1134 () (_ BitVec 64))

(assert (=> b!361798 (= e!221580 (and (not (= (select (arr!9668 _keys!1541) from!1924) k!1134)) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) (size!10020 _keys!1541))))))

(declare-fun b!361799 () Bool)

(declare-fun res!201278 () Bool)

(assert (=> b!361799 (=> (not res!201278) (not e!221580))))

(declare-datatypes ((List!5516 0))(
  ( (Nil!5513) (Cons!5512 (h!6368 (_ BitVec 64)) (t!10666 List!5516)) )
))
(declare-fun arrayNoDuplicates!0 (array!20363 (_ BitVec 32) List!5516) Bool)

(assert (=> b!361799 (= res!201278 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5513))))

(declare-fun b!361800 () Bool)

(declare-fun res!201276 () Bool)

(assert (=> b!361800 (=> (not res!201276) (not e!221580))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361800 (= res!201276 (and (= (size!10021 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10020 _keys!1541) (size!10021 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14136 () Bool)

(declare-fun mapRes!14136 () Bool)

(assert (=> mapIsEmpty!14136 mapRes!14136))

(declare-fun b!361801 () Bool)

(assert (=> b!361801 (= e!221582 (and e!221583 mapRes!14136))))

(declare-fun condMapEmpty!14136 () Bool)

(declare-fun mapDefault!14136 () ValueCell!3859)

