; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36012 () Bool)

(assert start!36012)

(declare-fun mapIsEmpty!14121 () Bool)

(declare-fun mapRes!14121 () Bool)

(assert (=> mapIsEmpty!14121 mapRes!14121))

(declare-fun res!201184 () Bool)

(declare-fun e!221508 () Bool)

(assert (=> start!36012 (=> (not res!201184) (not e!221508))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36012 (= res!201184 (validMask!0 mask!1943))))

(assert (=> start!36012 e!221508))

(assert (=> start!36012 true))

(declare-datatypes ((array!20343 0))(
  ( (array!20344 (arr!9658 (Array (_ BitVec 32) (_ BitVec 64))) (size!10010 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20343)

(declare-fun array_inv!7104 (array!20343) Bool)

(assert (=> start!36012 (array_inv!7104 _keys!1541)))

(declare-datatypes ((V!12171 0))(
  ( (V!12172 (val!4242 Int)) )
))
(declare-datatypes ((ValueCell!3854 0))(
  ( (ValueCellFull!3854 (v!6437 V!12171)) (EmptyCell!3854) )
))
(declare-datatypes ((array!20345 0))(
  ( (array!20346 (arr!9659 (Array (_ BitVec 32) ValueCell!3854)) (size!10011 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20345)

(declare-fun e!221507 () Bool)

(declare-fun array_inv!7105 (array!20345) Bool)

(assert (=> start!36012 (and (array_inv!7105 _values!1277) e!221507)))

(declare-fun from!1924 () (_ BitVec 32))

(declare-fun b!361661 () Bool)

(declare-fun k!1134 () (_ BitVec 64))

(assert (=> b!361661 (= e!221508 (and (not (= (select (arr!9658 _keys!1541) from!1924) k!1134)) (bvslt (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000)))))

(declare-fun b!361662 () Bool)

(declare-fun res!201186 () Bool)

(assert (=> b!361662 (=> (not res!201186) (not e!221508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20343 (_ BitVec 32)) Bool)

(assert (=> b!361662 (= res!201186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361663 () Bool)

(declare-fun e!221506 () Bool)

(assert (=> b!361663 (= e!221507 (and e!221506 mapRes!14121))))

(declare-fun condMapEmpty!14121 () Bool)

(declare-fun mapDefault!14121 () ValueCell!3854)

