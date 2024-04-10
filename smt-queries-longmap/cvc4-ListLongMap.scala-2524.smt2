; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38966 () Bool)

(assert start!38966)

(declare-fun b!408029 () Bool)

(declare-fun e!244974 () Bool)

(declare-fun e!244971 () Bool)

(declare-fun mapRes!17199 () Bool)

(assert (=> b!408029 (= e!244974 (and e!244971 mapRes!17199))))

(declare-fun condMapEmpty!17199 () Bool)

(declare-datatypes ((V!14951 0))(
  ( (V!14952 (val!5237 Int)) )
))
(declare-datatypes ((ValueCell!4849 0))(
  ( (ValueCellFull!4849 (v!7484 V!14951)) (EmptyCell!4849) )
))
(declare-datatypes ((array!24651 0))(
  ( (array!24652 (arr!11775 (Array (_ BitVec 32) ValueCell!4849)) (size!12127 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24651)

(declare-fun mapDefault!17199 () ValueCell!4849)

