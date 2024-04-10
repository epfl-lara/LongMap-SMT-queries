; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20776 () Bool)

(assert start!20776)

(declare-fun b!208104 () Bool)

(declare-fun res!101162 () Bool)

(declare-fun e!135778 () Bool)

(assert (=> b!208104 (=> (not res!101162) (not e!135778))))

(declare-datatypes ((array!9787 0))(
  ( (array!9788 (arr!4644 (Array (_ BitVec 32) (_ BitVec 64))) (size!4969 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9787)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6701 0))(
  ( (V!6702 (val!2690 Int)) )
))
(declare-datatypes ((ValueCell!2302 0))(
  ( (ValueCellFull!2302 (v!4660 V!6701)) (EmptyCell!2302) )
))
(declare-datatypes ((array!9789 0))(
  ( (array!9790 (arr!4645 (Array (_ BitVec 32) ValueCell!2302)) (size!4970 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9789)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!208104 (= res!101162 (and (= (size!4970 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4969 _keys!825) (size!4970 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!101164 () Bool)

(assert (=> start!20776 (=> (not res!101164) (not e!135778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20776 (= res!101164 (validMask!0 mask!1149))))

(assert (=> start!20776 e!135778))

(assert (=> start!20776 true))

(declare-fun e!135775 () Bool)

(declare-fun array_inv!3079 (array!9789) Bool)

(assert (=> start!20776 (and (array_inv!3079 _values!649) e!135775)))

(declare-fun array_inv!3080 (array!9787) Bool)

(assert (=> start!20776 (array_inv!3080 _keys!825)))

(declare-fun mapIsEmpty!9005 () Bool)

(declare-fun mapRes!9005 () Bool)

(assert (=> mapIsEmpty!9005 mapRes!9005))

(declare-fun b!208105 () Bool)

(declare-fun res!101163 () Bool)

(assert (=> b!208105 (=> (not res!101163) (not e!135778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9787 (_ BitVec 32)) Bool)

(assert (=> b!208105 (= res!101163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208106 () Bool)

(declare-fun e!135776 () Bool)

(declare-fun tp_is_empty!5291 () Bool)

(assert (=> b!208106 (= e!135776 tp_is_empty!5291)))

(declare-fun b!208107 () Bool)

(assert (=> b!208107 (= e!135778 false)))

(declare-fun lt!106728 () Bool)

(declare-datatypes ((List!2972 0))(
  ( (Nil!2969) (Cons!2968 (h!3610 (_ BitVec 64)) (t!7903 List!2972)) )
))
(declare-fun arrayNoDuplicates!0 (array!9787 (_ BitVec 32) List!2972) Bool)

(assert (=> b!208107 (= lt!106728 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2969))))

(declare-fun b!208108 () Bool)

(declare-fun e!135777 () Bool)

(assert (=> b!208108 (= e!135777 tp_is_empty!5291)))

(declare-fun mapNonEmpty!9005 () Bool)

(declare-fun tp!19328 () Bool)

(assert (=> mapNonEmpty!9005 (= mapRes!9005 (and tp!19328 e!135777))))

(declare-fun mapKey!9005 () (_ BitVec 32))

(declare-fun mapRest!9005 () (Array (_ BitVec 32) ValueCell!2302))

(declare-fun mapValue!9005 () ValueCell!2302)

(assert (=> mapNonEmpty!9005 (= (arr!4645 _values!649) (store mapRest!9005 mapKey!9005 mapValue!9005))))

(declare-fun b!208109 () Bool)

(assert (=> b!208109 (= e!135775 (and e!135776 mapRes!9005))))

(declare-fun condMapEmpty!9005 () Bool)

(declare-fun mapDefault!9005 () ValueCell!2302)

