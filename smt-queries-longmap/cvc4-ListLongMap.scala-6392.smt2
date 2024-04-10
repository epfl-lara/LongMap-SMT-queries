; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82152 () Bool)

(assert start!82152)

(declare-fun b!957527 () Bool)

(declare-fun e!539759 () Bool)

(assert (=> b!957527 (= e!539759 false)))

(declare-fun lt!430338 () Bool)

(declare-datatypes ((array!58367 0))(
  ( (array!58368 (arr!28057 (Array (_ BitVec 32) (_ BitVec 64))) (size!28536 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58367)

(declare-datatypes ((List!19514 0))(
  ( (Nil!19511) (Cons!19510 (h!20672 (_ BitVec 64)) (t!27877 List!19514)) )
))
(declare-fun arrayNoDuplicates!0 (array!58367 (_ BitVec 32) List!19514) Bool)

(assert (=> b!957527 (= lt!430338 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19511))))

(declare-fun mapNonEmpty!33676 () Bool)

(declare-fun mapRes!33676 () Bool)

(declare-fun tp!64281 () Bool)

(declare-fun e!539756 () Bool)

(assert (=> mapNonEmpty!33676 (= mapRes!33676 (and tp!64281 e!539756))))

(declare-datatypes ((V!33157 0))(
  ( (V!33158 (val!10616 Int)) )
))
(declare-datatypes ((ValueCell!10084 0))(
  ( (ValueCellFull!10084 (v!13173 V!33157)) (EmptyCell!10084) )
))
(declare-fun mapRest!33676 () (Array (_ BitVec 32) ValueCell!10084))

(declare-fun mapKey!33676 () (_ BitVec 32))

(declare-fun mapValue!33676 () ValueCell!10084)

(declare-datatypes ((array!58369 0))(
  ( (array!58370 (arr!28058 (Array (_ BitVec 32) ValueCell!10084)) (size!28537 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58369)

(assert (=> mapNonEmpty!33676 (= (arr!28058 _values!1386) (store mapRest!33676 mapKey!33676 mapValue!33676))))

(declare-fun mapIsEmpty!33676 () Bool)

(assert (=> mapIsEmpty!33676 mapRes!33676))

(declare-fun b!957528 () Bool)

(declare-fun e!539758 () Bool)

(declare-fun tp_is_empty!21131 () Bool)

(assert (=> b!957528 (= e!539758 tp_is_empty!21131)))

(declare-fun b!957529 () Bool)

(declare-fun res!640976 () Bool)

(assert (=> b!957529 (=> (not res!640976) (not e!539759))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58367 (_ BitVec 32)) Bool)

(assert (=> b!957529 (= res!640976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957530 () Bool)

(declare-fun e!539757 () Bool)

(assert (=> b!957530 (= e!539757 (and e!539758 mapRes!33676))))

(declare-fun condMapEmpty!33676 () Bool)

(declare-fun mapDefault!33676 () ValueCell!10084)

