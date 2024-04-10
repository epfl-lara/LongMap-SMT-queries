; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36612 () Bool)

(assert start!36612)

(declare-fun b!365503 () Bool)

(declare-fun res!204359 () Bool)

(declare-fun e!223816 () Bool)

(assert (=> b!365503 (=> (not res!204359) (not e!223816))))

(declare-datatypes ((List!5527 0))(
  ( (Nil!5524) (Cons!5523 (h!6379 (_ BitVec 64)) (t!10677 List!5527)) )
))
(declare-fun noDuplicate!187 (List!5527) Bool)

(assert (=> b!365503 (= res!204359 (noDuplicate!187 Nil!5524))))

(declare-fun b!365504 () Bool)

(declare-fun res!204360 () Bool)

(assert (=> b!365504 (=> (not res!204360) (not e!223816))))

(declare-datatypes ((array!20875 0))(
  ( (array!20876 (arr!9911 (Array (_ BitVec 32) (_ BitVec 64))) (size!10263 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20875)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20875 (_ BitVec 32)) Bool)

(assert (=> b!365504 (= res!204360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365505 () Bool)

(declare-fun res!204364 () Bool)

(assert (=> b!365505 (=> (not res!204364) (not e!223816))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12383 0))(
  ( (V!12384 (val!4274 Int)) )
))
(declare-datatypes ((ValueCell!3886 0))(
  ( (ValueCellFull!3886 (v!6469 V!12383)) (EmptyCell!3886) )
))
(declare-datatypes ((array!20877 0))(
  ( (array!20878 (arr!9912 (Array (_ BitVec 32) ValueCell!3886)) (size!10264 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20877)

(assert (=> b!365505 (= res!204364 (and (= (size!10264 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10263 _keys!658) (size!10264 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365506 () Bool)

(declare-fun res!204363 () Bool)

(assert (=> b!365506 (=> (not res!204363) (not e!223816))))

(assert (=> b!365506 (= res!204363 (and (bvsle #b00000000000000000000000000000000 (size!10263 _keys!658)) (bvslt (size!10263 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365507 () Bool)

(declare-fun e!223818 () Bool)

(declare-fun tp_is_empty!8459 () Bool)

(assert (=> b!365507 (= e!223818 tp_is_empty!8459)))

(declare-fun b!365508 () Bool)

(declare-fun e!223814 () Bool)

(assert (=> b!365508 (= e!223816 e!223814)))

(declare-fun res!204362 () Bool)

(assert (=> b!365508 (=> res!204362 e!223814)))

(declare-fun contains!2433 (List!5527 (_ BitVec 64)) Bool)

(assert (=> b!365508 (= res!204362 (contains!2433 Nil!5524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!14238 () Bool)

(declare-fun mapRes!14238 () Bool)

(declare-fun tp!28314 () Bool)

(assert (=> mapNonEmpty!14238 (= mapRes!14238 (and tp!28314 e!223818))))

(declare-fun mapValue!14238 () ValueCell!3886)

(declare-fun mapKey!14238 () (_ BitVec 32))

(declare-fun mapRest!14238 () (Array (_ BitVec 32) ValueCell!3886))

(assert (=> mapNonEmpty!14238 (= (arr!9912 _values!506) (store mapRest!14238 mapKey!14238 mapValue!14238))))

(declare-fun b!365509 () Bool)

(assert (=> b!365509 (= e!223814 (contains!2433 Nil!5524 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!204361 () Bool)

(assert (=> start!36612 (=> (not res!204361) (not e!223816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36612 (= res!204361 (validMask!0 mask!970))))

(assert (=> start!36612 e!223816))

(assert (=> start!36612 true))

(declare-fun e!223817 () Bool)

(declare-fun array_inv!7340 (array!20877) Bool)

(assert (=> start!36612 (and (array_inv!7340 _values!506) e!223817)))

(declare-fun array_inv!7341 (array!20875) Bool)

(assert (=> start!36612 (array_inv!7341 _keys!658)))

(declare-fun b!365510 () Bool)

(declare-fun e!223819 () Bool)

(assert (=> b!365510 (= e!223819 tp_is_empty!8459)))

(declare-fun b!365511 () Bool)

(assert (=> b!365511 (= e!223817 (and e!223819 mapRes!14238))))

(declare-fun condMapEmpty!14238 () Bool)

(declare-fun mapDefault!14238 () ValueCell!3886)

