; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82528 () Bool)

(assert start!82528)

(declare-fun b!961730 () Bool)

(declare-fun e!542345 () Bool)

(declare-fun tp_is_empty!21463 () Bool)

(assert (=> b!961730 (= e!542345 tp_is_empty!21463)))

(declare-fun b!961731 () Bool)

(declare-fun res!643621 () Bool)

(declare-fun e!542344 () Bool)

(assert (=> b!961731 (=> (not res!643621) (not e!542344))))

(declare-datatypes ((array!59023 0))(
  ( (array!59024 (arr!28380 (Array (_ BitVec 32) (_ BitVec 64))) (size!28859 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59023)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59023 (_ BitVec 32)) Bool)

(assert (=> b!961731 (= res!643621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961732 () Bool)

(declare-fun e!542341 () Bool)

(assert (=> b!961732 (= e!542341 tp_is_empty!21463)))

(declare-fun b!961733 () Bool)

(assert (=> b!961733 (= e!542344 false)))

(declare-fun lt!430804 () Bool)

(declare-datatypes ((List!19700 0))(
  ( (Nil!19697) (Cons!19696 (h!20858 (_ BitVec 64)) (t!28063 List!19700)) )
))
(declare-fun arrayNoDuplicates!0 (array!59023 (_ BitVec 32) List!19700) Bool)

(assert (=> b!961733 (= lt!430804 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19697))))

(declare-fun b!961734 () Bool)

(declare-fun e!542343 () Bool)

(declare-fun mapRes!34189 () Bool)

(assert (=> b!961734 (= e!542343 (and e!542341 mapRes!34189))))

(declare-fun condMapEmpty!34189 () Bool)

(declare-datatypes ((V!33601 0))(
  ( (V!33602 (val!10782 Int)) )
))
(declare-datatypes ((ValueCell!10250 0))(
  ( (ValueCellFull!10250 (v!13340 V!33601)) (EmptyCell!10250) )
))
(declare-datatypes ((array!59025 0))(
  ( (array!59026 (arr!28381 (Array (_ BitVec 32) ValueCell!10250)) (size!28860 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59025)

(declare-fun mapDefault!34189 () ValueCell!10250)

