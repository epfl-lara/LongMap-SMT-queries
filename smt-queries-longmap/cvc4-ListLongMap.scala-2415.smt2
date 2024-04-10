; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38200 () Bool)

(assert start!38200)

(declare-fun b_free!9059 () Bool)

(declare-fun b_next!9059 () Bool)

(assert (=> start!38200 (= b_free!9059 (not b_next!9059))))

(declare-fun tp!31962 () Bool)

(declare-fun b_and!16433 () Bool)

(assert (=> start!38200 (= tp!31962 b_and!16433)))

(declare-fun b!393994 () Bool)

(declare-fun res!225799 () Bool)

(declare-fun e!238511 () Bool)

(assert (=> b!393994 (=> (not res!225799) (not e!238511))))

(declare-datatypes ((array!23369 0))(
  ( (array!23370 (arr!11142 (Array (_ BitVec 32) (_ BitVec 64))) (size!11494 (_ BitVec 32))) )
))
(declare-fun lt!186583 () array!23369)

(declare-datatypes ((List!6482 0))(
  ( (Nil!6479) (Cons!6478 (h!7334 (_ BitVec 64)) (t!11654 List!6482)) )
))
(declare-fun arrayNoDuplicates!0 (array!23369 (_ BitVec 32) List!6482) Bool)

(assert (=> b!393994 (= res!225799 (arrayNoDuplicates!0 lt!186583 #b00000000000000000000000000000000 Nil!6479))))

(declare-fun b!393996 () Bool)

(declare-fun res!225803 () Bool)

(declare-fun e!238513 () Bool)

(assert (=> b!393996 (=> (not res!225803) (not e!238513))))

(declare-fun _keys!658 () array!23369)

(assert (=> b!393996 (= res!225803 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6479))))

(declare-fun b!393997 () Bool)

(declare-fun e!238508 () Bool)

(declare-fun tp_is_empty!9731 () Bool)

(assert (=> b!393997 (= e!238508 tp_is_empty!9731)))

(declare-fun mapNonEmpty!16194 () Bool)

(declare-fun mapRes!16194 () Bool)

(declare-fun tp!31961 () Bool)

(declare-fun e!238507 () Bool)

(assert (=> mapNonEmpty!16194 (= mapRes!16194 (and tp!31961 e!238507))))

(declare-datatypes ((V!14079 0))(
  ( (V!14080 (val!4910 Int)) )
))
(declare-datatypes ((ValueCell!4522 0))(
  ( (ValueCellFull!4522 (v!7151 V!14079)) (EmptyCell!4522) )
))
(declare-fun mapValue!16194 () ValueCell!4522)

(declare-datatypes ((array!23371 0))(
  ( (array!23372 (arr!11143 (Array (_ BitVec 32) ValueCell!4522)) (size!11495 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23371)

(declare-fun mapKey!16194 () (_ BitVec 32))

(declare-fun mapRest!16194 () (Array (_ BitVec 32) ValueCell!4522))

(assert (=> mapNonEmpty!16194 (= (arr!11143 _values!506) (store mapRest!16194 mapKey!16194 mapValue!16194))))

(declare-fun b!393998 () Bool)

(declare-fun e!238509 () Bool)

(assert (=> b!393998 (= e!238509 (and e!238508 mapRes!16194))))

(declare-fun condMapEmpty!16194 () Bool)

(declare-fun mapDefault!16194 () ValueCell!4522)

