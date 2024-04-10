; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40882 () Bool)

(assert start!40882)

(declare-fun b_free!10817 () Bool)

(declare-fun b_next!10817 () Bool)

(assert (=> start!40882 (= b_free!10817 (not b_next!10817))))

(declare-fun tp!38277 () Bool)

(declare-fun b_and!18959 () Bool)

(assert (=> start!40882 (= tp!38277 b_and!18959)))

(declare-fun res!270421 () Bool)

(declare-fun e!265709 () Bool)

(assert (=> start!40882 (=> (not res!270421) (not e!265709))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28115 0))(
  ( (array!28116 (arr!13501 (Array (_ BitVec 32) (_ BitVec 64))) (size!13853 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28115)

(assert (=> start!40882 (= res!270421 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13853 _keys!709))))))

(assert (=> start!40882 e!265709))

(declare-fun tp_is_empty!12155 () Bool)

(assert (=> start!40882 tp_is_empty!12155))

(assert (=> start!40882 tp!38277))

(assert (=> start!40882 true))

(declare-datatypes ((V!17311 0))(
  ( (V!17312 (val!6122 Int)) )
))
(declare-datatypes ((ValueCell!5734 0))(
  ( (ValueCellFull!5734 (v!8388 V!17311)) (EmptyCell!5734) )
))
(declare-datatypes ((array!28117 0))(
  ( (array!28118 (arr!13502 (Array (_ BitVec 32) ValueCell!5734)) (size!13854 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28117)

(declare-fun e!265707 () Bool)

(declare-fun array_inv!9778 (array!28117) Bool)

(assert (=> start!40882 (and (array_inv!9778 _values!549) e!265707)))

(declare-fun array_inv!9779 (array!28115) Bool)

(assert (=> start!40882 (array_inv!9779 _keys!709)))

(declare-fun b!454007 () Bool)

(declare-fun res!270429 () Bool)

(assert (=> b!454007 (=> (not res!270429) (not e!265709))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28115 (_ BitVec 32)) Bool)

(assert (=> b!454007 (= res!270429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454008 () Bool)

(declare-fun res!270431 () Bool)

(declare-fun e!265706 () Bool)

(assert (=> b!454008 (=> (not res!270431) (not e!265706))))

(declare-fun lt!206049 () array!28115)

(declare-datatypes ((List!8123 0))(
  ( (Nil!8120) (Cons!8119 (h!8975 (_ BitVec 64)) (t!13951 List!8123)) )
))
(declare-fun arrayNoDuplicates!0 (array!28115 (_ BitVec 32) List!8123) Bool)

(assert (=> b!454008 (= res!270431 (arrayNoDuplicates!0 lt!206049 #b00000000000000000000000000000000 Nil!8120))))

(declare-fun b!454009 () Bool)

(declare-fun res!270430 () Bool)

(assert (=> b!454009 (=> (not res!270430) (not e!265709))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!454009 (= res!270430 (and (= (size!13854 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13853 _keys!709) (size!13854 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454010 () Bool)

(declare-fun e!265710 () Bool)

(declare-fun mapRes!19873 () Bool)

(assert (=> b!454010 (= e!265707 (and e!265710 mapRes!19873))))

(declare-fun condMapEmpty!19873 () Bool)

(declare-fun mapDefault!19873 () ValueCell!5734)

