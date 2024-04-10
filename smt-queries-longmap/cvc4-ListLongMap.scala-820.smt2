; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19998 () Bool)

(assert start!19998)

(declare-fun b!195983 () Bool)

(declare-fun res!92474 () Bool)

(declare-fun e!129011 () Bool)

(assert (=> b!195983 (=> (not res!92474) (not e!129011))))

(declare-datatypes ((array!8329 0))(
  ( (array!8330 (arr!3917 (Array (_ BitVec 32) (_ BitVec 64))) (size!4242 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8329)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5693 0))(
  ( (V!5694 (val!2312 Int)) )
))
(declare-datatypes ((ValueCell!1924 0))(
  ( (ValueCellFull!1924 (v!4281 V!5693)) (EmptyCell!1924) )
))
(declare-datatypes ((array!8331 0))(
  ( (array!8332 (arr!3918 (Array (_ BitVec 32) ValueCell!1924)) (size!4243 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8331)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!195983 (= res!92474 (and (= (size!4243 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4242 _keys!825) (size!4243 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92472 () Bool)

(assert (=> start!19998 (=> (not res!92472) (not e!129011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19998 (= res!92472 (validMask!0 mask!1149))))

(assert (=> start!19998 e!129011))

(assert (=> start!19998 true))

(declare-fun e!129013 () Bool)

(declare-fun array_inv!2545 (array!8331) Bool)

(assert (=> start!19998 (and (array_inv!2545 _values!649) e!129013)))

(declare-fun array_inv!2546 (array!8329) Bool)

(assert (=> start!19998 (array_inv!2546 _keys!825)))

(declare-fun b!195984 () Bool)

(declare-fun e!129015 () Bool)

(declare-fun tp_is_empty!4535 () Bool)

(assert (=> b!195984 (= e!129015 tp_is_empty!4535)))

(declare-fun b!195985 () Bool)

(declare-fun e!129012 () Bool)

(assert (=> b!195985 (= e!129012 tp_is_empty!4535)))

(declare-fun mapNonEmpty!7865 () Bool)

(declare-fun mapRes!7865 () Bool)

(declare-fun tp!17153 () Bool)

(assert (=> mapNonEmpty!7865 (= mapRes!7865 (and tp!17153 e!129015))))

(declare-fun mapValue!7865 () ValueCell!1924)

(declare-fun mapRest!7865 () (Array (_ BitVec 32) ValueCell!1924))

(declare-fun mapKey!7865 () (_ BitVec 32))

(assert (=> mapNonEmpty!7865 (= (arr!3918 _values!649) (store mapRest!7865 mapKey!7865 mapValue!7865))))

(declare-fun mapIsEmpty!7865 () Bool)

(assert (=> mapIsEmpty!7865 mapRes!7865))

(declare-fun b!195986 () Bool)

(declare-datatypes ((List!2457 0))(
  ( (Nil!2454) (Cons!2453 (h!3095 (_ BitVec 64)) (t!7388 List!2457)) )
))
(declare-fun noDuplicate!59 (List!2457) Bool)

(assert (=> b!195986 (= e!129011 (not (noDuplicate!59 Nil!2454)))))

(declare-fun b!195987 () Bool)

(declare-fun res!92471 () Bool)

(assert (=> b!195987 (=> (not res!92471) (not e!129011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8329 (_ BitVec 32)) Bool)

(assert (=> b!195987 (= res!92471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!195988 () Bool)

(declare-fun res!92473 () Bool)

(assert (=> b!195988 (=> (not res!92473) (not e!129011))))

(assert (=> b!195988 (= res!92473 (and (bvsle #b00000000000000000000000000000000 (size!4242 _keys!825)) (bvslt (size!4242 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun b!195989 () Bool)

(assert (=> b!195989 (= e!129013 (and e!129012 mapRes!7865))))

(declare-fun condMapEmpty!7865 () Bool)

(declare-fun mapDefault!7865 () ValueCell!1924)

