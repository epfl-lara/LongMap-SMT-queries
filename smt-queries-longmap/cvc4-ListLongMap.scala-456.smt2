; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8352 () Bool)

(assert start!8352)

(declare-fun b!55645 () Bool)

(declare-fun b_free!1869 () Bool)

(declare-fun b_next!1869 () Bool)

(assert (=> b!55645 (= b_free!1869 (not b_next!1869))))

(declare-fun tp!7707 () Bool)

(declare-fun b_and!3279 () Bool)

(assert (=> b!55645 (= tp!7707 b_and!3279)))

(declare-fun b!55633 () Bool)

(declare-fun b_free!1871 () Bool)

(declare-fun b_next!1871 () Bool)

(assert (=> b!55633 (= b_free!1871 (not b_next!1871))))

(declare-fun tp!7708 () Bool)

(declare-fun b_and!3281 () Bool)

(assert (=> b!55633 (= tp!7708 b_and!3281)))

(declare-fun b!55630 () Bool)

(declare-fun e!36563 () Bool)

(declare-fun e!36561 () Bool)

(declare-fun mapRes!2724 () Bool)

(assert (=> b!55630 (= e!36563 (and e!36561 mapRes!2724))))

(declare-fun condMapEmpty!2723 () Bool)

(declare-datatypes ((V!2781 0))(
  ( (V!2782 (val!1220 Int)) )
))
(declare-datatypes ((array!3625 0))(
  ( (array!3626 (arr!1735 (Array (_ BitVec 32) (_ BitVec 64))) (size!1964 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!832 0))(
  ( (ValueCellFull!832 (v!2326 V!2781)) (EmptyCell!832) )
))
(declare-datatypes ((array!3627 0))(
  ( (array!3628 (arr!1736 (Array (_ BitVec 32) ValueCell!832)) (size!1965 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!572 0))(
  ( (LongMapFixedSize!573 (defaultEntry!2000 Int) (mask!5859 (_ BitVec 32)) (extraKeys!1891 (_ BitVec 32)) (zeroValue!1918 V!2781) (minValue!1918 V!2781) (_size!335 (_ BitVec 32)) (_keys!3620 array!3625) (_values!1983 array!3627) (_vacant!335 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!388 0))(
  ( (Cell!389 (v!2327 LongMapFixedSize!572)) )
))
(declare-datatypes ((LongMap!388 0))(
  ( (LongMap!389 (underlying!205 Cell!388)) )
))
(declare-fun thiss!992 () LongMap!388)

(declare-fun mapDefault!2723 () ValueCell!832)

