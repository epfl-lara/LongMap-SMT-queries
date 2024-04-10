; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93632 () Bool)

(assert start!93632)

(declare-fun b!1059357 () Bool)

(declare-fun res!707683 () Bool)

(declare-fun e!602909 () Bool)

(assert (=> b!1059357 (=> (not res!707683) (not e!602909))))

(declare-datatypes ((array!66905 0))(
  ( (array!66906 (arr!32162 (Array (_ BitVec 32) (_ BitVec 64))) (size!32698 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66905)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66905 (_ BitVec 32)) Bool)

(assert (=> b!1059357 (= res!707683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059358 () Bool)

(declare-fun e!602913 () Bool)

(declare-fun tp_is_empty!24937 () Bool)

(assert (=> b!1059358 (= e!602913 tp_is_empty!24937)))

(declare-fun b!1059359 () Bool)

(declare-fun e!602911 () Bool)

(declare-fun e!602910 () Bool)

(declare-fun mapRes!39070 () Bool)

(assert (=> b!1059359 (= e!602911 (and e!602910 mapRes!39070))))

(declare-fun condMapEmpty!39070 () Bool)

(declare-datatypes ((V!38385 0))(
  ( (V!38386 (val!12519 Int)) )
))
(declare-datatypes ((ValueCell!11765 0))(
  ( (ValueCellFull!11765 (v!15129 V!38385)) (EmptyCell!11765) )
))
(declare-datatypes ((array!66907 0))(
  ( (array!66908 (arr!32163 (Array (_ BitVec 32) ValueCell!11765)) (size!32699 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66907)

(declare-fun mapDefault!39070 () ValueCell!11765)

